class Public::CartItemsController < ApplicationController
  def index
    @cart_items = current_end_user.cart_items
  end

  def update
    cart_item = CartItem.find(params[:id])
    cart_item.amount = params[:cart_item][:amount]
    cart_item.save
    redirect_to cart_items_path
  end

  def destroy
    cart_item = CartItem.find(params[:id])
    cart_item.destroy
    redirect_to cart_items_path
  end

  def destroy_all
    current_end_user.cart_items.destroy_all
    redirect_to root_path
  end

  def create
    cart_item = CartItem.new(amount: params[:cart_item][:amount])
    cart_item.end_user_id = current_end_user.id
    cart_item.item_id = params[:cart_item][:id]
    if cart_item.save
      redirect_to cart_items_path
    else
      @item = Item.find(params[:cart_item][:id])
      render  item_path(@item)
    end
  end
end
