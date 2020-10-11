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

  def order_params
    params.merge(token: params[:token])
  end

  def address_params
    params.permit(:post_code, :prefecture_id, :city, :house_number, :building_name, :phone_number, :purchase_id)
  end
end
