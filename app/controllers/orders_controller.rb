class OrdersController < ApplicationController
  def index
  end

  def new
  end

  def create
    @order = Order.new(order_params)
    if 
    @address = Address.create(address_params)
  end

  private
  
  def pay_item
    @item = Item.find(params[:item_id])
    Payjp.api_key = "sk_test_f3f58ebe7dec6eb9e9f9389c"
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  def order_params
    params.merge(token: params[:token])
  end

  def address_params
    params.permit(:post_code, :prefecture_id, :city, :house_number, :building_name, :phone_number, :purchase_id)
  end
end
