class OrdersController < ApplicationController
  def index
    @order = Order.new
    @item = Item.find(params[:item_id])
  end
  
  def create
    # binding.pry
    @order = Order.new(order_params)
    if @order.valid?
      pay_item
      @order.save
      redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      render :index
    end
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
    params.require(:order).permit(:post_code, :prefecture_id, :city, :house_number, :building_name, :phone_number, :purchase_id).merge(user_id: current_user.id, token: params[:token], item_id: params[:item_id])
  end

end
