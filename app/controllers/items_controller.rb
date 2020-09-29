class ItemsController < ApplicationController
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
  end

  private

  def item_params
    params.require(:item).permit(:content, :image).merge(user_id: current_user.id)
  end

end
