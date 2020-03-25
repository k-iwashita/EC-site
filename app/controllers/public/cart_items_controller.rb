class Public::CartItemsController < ApplicationController
  def index
    
  end

  def update
  end

  def destroy

  end

  def destroy_all

  end

  def create
    cart_item = CartItem.new(amount: params[:cart_item][:amount])
    cart_item.end_user_id = current_end_user.id
    cart_item.item_id = params[:cart_item][:id]
    cart_item.save
    redirect_to cart_items_path
  end
end
