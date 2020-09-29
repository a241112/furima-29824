class ItemsController < ApplicationController
  def index
  end
  def new
    @item = Category.all
  end
end
