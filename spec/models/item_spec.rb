require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '商品が出品できるとき' do
      it 'image、name、description、category_id、condition_id、postage_id、prefecture_id、shipping_day_id、priceが存在すれば出品できる' do
        expect(@item).to be_valid
      end
    end
    context '商品が出品できないとき' do
      it 'imageが空では出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("画像を入力してください")
      end
      it 'nameが空では出品できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("商品名を入力してください")
      end
      it 'descriptionが空では出品できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の説明を入力してください")
      end
      it 'category_idが「---」のままでは出品できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('カテゴリーを選択してください')
      end
      it 'condition_idが「---」のままでは出品できない' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('商品の状態を選択してください')
      end
      it 'postage_idが「---」のままでは出品できない' do
        @item.postage_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('配送料の負担を選択してください')
      end
      it 'prefecture_idが「---」のままでは出品できない' do
        @item.prefecture_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('発送元の地域を選択してください')
      end
      it 'shipping_day_idが「---」では出品できない' do
        @item.shipping_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('発送までの日数を選択してください')
      end
      it 'priceが空では出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("価格を入力してください")
      end
      it '販売価格が半角でなければ出品できない' do
        @item.price = '５００'
        @item.valid?
        expect(@item.errors.full_messages).to include("価格は半角数字で入力してください")
      end
      it '価格が¥300以下であれば出品できない' do
        @item.price = '100'
        @item.valid?
        expect(@item.errors.full_messages).to include('価格は¥300~¥9,999,999で入力してください')
      end
      it '価格が¥9,999,999以上であれば出品できない' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include('価格は¥300~¥9,999,999で入力してください')
      end
    end
  end
end
