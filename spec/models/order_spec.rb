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
        expect(@order.errors.full_messages).to include("Token can't be blank")
      end
      it 'post_codeが空では購入できない' do
        @order.post_code = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Post code can't be blank")
      end
      it 'prefecture_idが「---」のままでは購入できない' do
        @order.prefecture_id = 0
        @order.valid?
        expect(@order.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'cityが空では購入できない' do
        @order.city = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("City can't be blank")
      end
      it 'house_numberが空では購入できない' do
        @order.house_number = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("House number can't be blank")
      end
      it 'phone_numberが空では購入できない' do
        @order.phone_number = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'post_cideが半角のハイフンを含んだ正しい形式でなければ購入できない' do
        @order.post_code = '1234567'
        @order.valid?
        expect(@order.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
      end
      it 'phone_numberにハイフンがあれば購入できない' do
        @order.phone_number = '090-1111-2222'
        @order.valid?
      end
      it 'phone_numberが半角でなければ購入できない' do
        @order.phone_number = '０９０１１１１２２２２'
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number is invalid. Input half-width numbers.")
      end
      it 'phone_numberが11桁以上であれば保存できない' do
        @order.phone_number = '090111122222'
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number is too long (maximum is 11 characters)")
      end
    end
  end
end
