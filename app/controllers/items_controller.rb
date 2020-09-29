class ItemsController < ApplicationController
  def index
  end
  def new
    @item = Category.all
    @item = Condition.all
    @item = Postage.all
    @item = Prefecture.all
  end
end
