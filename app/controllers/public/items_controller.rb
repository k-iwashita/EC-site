class Public::ItemsController < ApplicationController
  def index
    if params[:items] && params[:items][:name]
      item_name = params[:items][:name]
      @items = Item.where(name: item_name)
    else
      @items = Item.all
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def top
  end
end
