class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  def index
  end

  def new
    @item = Category.all
    @item = Condition.all
    @item = Postage.all
    @item = Prefecture.all
    @item = ShippingDay.all
  end

  def create
    Item.create(params[:item])
  end

  private

  def item_params
    params.require(:item).permit(:content, :image).merge(user_id: current_user.id)
  end

end
