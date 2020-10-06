class ItemsController < ApplicationController
  before_action :set_item ,only: [:edit, :show, :update, :destroy]
  before_action :user_condition , only: [:edit, :update]
  before_action :authenticate_user!, only: [:new]
  def index
    @item = Item.all.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    if @item.destroy
      redirect_to root_path
    else
      render :show
    end
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def user_condition
    unless current_user == @item.user then
      redirect_to root_path
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :category_id, :condition_id, :postage_id, :prefecture_id, :shipping_day_id, :price, :image).merge(user_id: current_user.id)
  end
end
