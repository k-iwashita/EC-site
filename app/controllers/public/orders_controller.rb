class Public::OrdersController < ApplicationController
  def new
    if current_end_user.cart_items != []
      @total_price = 0
      @cart_items = current_end_user.cart_items
      @order = Order.new
    else
      redirect_to root_path
    end
  end

  def confirm
    @order = current_end_user.orders.new(order_params)
    @order.payment = params[:order][:payment]
    @order.payment_method = params[:order][:payment_method].to_i
    if params[:address] == '自宅'
      @order.address = current_end_user.address_home
      @order.postal_code = current_end_user.postal_code_home
      @order.address_user_name = current_end_user.family_name + current_end_user.last_name
    elsif params[:address]
      shipping_address = current_end_user.shipping_addresses.find(params[:address])
      @order.address = shipping_address.address
      @order.postal_code = shipping_address.postal_code
      @order.address_user_name = shipping_address.name
    else
      @order.address = params[:order][:address]
      @order.postal_code = params[:order][:postal_code]
      @order.address_user_name = params[:order][:address_user_name]
      address = current_end_user.shipping_addresses.create(name: params[:order][:address_user_name],
                                                           postal_code: params[:order][:postal_code],
                                                           address: params[:order][:address])
    end
    @total_price = 0
    @cart_items = current_end_user.cart_items
  end

  def create
    order = current_end_user.orders.new(all_order_params)
    order.save
    current_end_user.cart_items.each do |cart_item|
      item = cart_item.item
      order_details = item.order_details.new(order_id: order.id, amount: cart_item.amount,
                                             purchased_price: item.price_excluding_tax)
      order_details.save
    end
    current_end_user.cart_items.each do |item|
      item.destroy
    end
    redirect_to :action => 'done'
  end

  def done
  end

  def index
  end

  def show
  end

  private
  def order_params
    params.require(:order).permit(:address_user_name, :postal_code)
  end

  def all_order_params
    params.require(:order).permit(:address_user_name, :postal_code, :address, :pastage, :payment, :payment_method)
  end
end
