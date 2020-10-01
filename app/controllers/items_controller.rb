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
    @item = Item.new(item_params)
    if @item.save
      redirect_to item_path
    else
      render :new
    end 
  end

  private

  def item_params
    params.permit(:name, :description, :category_id, :condition_id, :postage_id, :prefecture_id, :shipping_day_id, :price, :image).merge(user_id: current_user.id)
  end

end
