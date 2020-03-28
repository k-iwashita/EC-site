class Public::ShippingAddressesController < ApplicationController
  def index

  end

  def edit

  end

  def create
    address = ShippingAddress.new(address_params)
    address.end_user_id = current_end_user.id
    address.save
    redirect_to new_order_path
  end

  def update

  end

  def destroy

  end

  private
    def address_params
      params.require(:shipping_address).permit(:name, :postal_code, :address)
    end
end
