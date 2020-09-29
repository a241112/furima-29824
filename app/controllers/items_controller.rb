class ItemsController < ApplicationController
  def index
  end
  def new
    @item = Category.all
    @item = Condition.all
  end
end
