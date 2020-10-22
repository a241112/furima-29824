require 'rails_helper'

RSpec.describe Order, type: :model do
  before do
    @order = FactoryBot.build(:order)
  end

  describe '商品購入機能' do
    context '商品が購入できるとき' do
      it 'token、post_code、prefecture_id、city、house_number、phone_numberが存在すれば購入できる' do
        expect(@order).to be_valid
      end
      it 'building_nameは空でも購入できる' do
        @order.building_name = nil
        expect(@order).to be_valid
      end
    end

    context '商品が購入できないとき' do
      it 'tokenが空では購入できない' do
        @order.token = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("クレジットカード情報を入力してください")
      end
      it 'post_codeが空では購入できない' do
        @order.post_code = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("郵便番号を入力してください")
      end
      it 'post_codeが半角のハイフンを含んだ正しい形式でなければ購入できない' do
        @order.post_code = '1234567'
        @order.valid?
        expect(@order.errors.full_messages).to include('郵便番号はハイフン(-)を入れてください')
      end
      it 'prefecture_idが「---」のままでは購入できない' do
        @order.prefecture_id = 0
        @order.valid?
        expect(@order.errors.full_messages).to include("都道府県を選択してください")
      end
      it 'cityが空では購入できない' do
        @order.city = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("市区町村を入力してください")
      end
      it 'house_numberが空では購入できない' do
        @order.house_number = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("番地を入力してください")
      end
      it 'phone_numberが空では購入できない' do
        @order.phone_number = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("電話番号を入力してください")
      end
      it 'phone_numberが半角でなければ購入できない' do
        @order.phone_number = '０９０１１１１２２２２'
        @order.valid?
        expect(@order.errors.full_messages).to include('電話番号は半角数字で入力してください')
      end
      it 'phone_numberが11桁以上であれば保存できない' do
        @order.phone_number = '090111122222'
        @order.valid?
        expect(@order.errors.full_messages).to include('電話番号は11文字以内で入力してください')
      end
    end
  end
end
