class Order < ApplicationRecord
  has_many :order_details
  belongs_to :end_user

  enum payment_method: { credit_card: 0, bank_transfer: 1 }
  enum order_status: { before_payment: 0, checked_payment: 1,
                       in_production: 2, preparing_shipment: 3, after_shipment: 4 }

  def set_address(user, params)
    if params[:order][:address] == '自宅'
      address = user.address_home
      postal_code = user.postal_code_home
      address_user_name = user.family_name + user.last_name
    elsif user.shipping_addresses.find_by(name: params[:order][:address])
      shipping_address = user.shipping_addresses.find_by(name: params[:order][:address])
      address = shipping_address.address
      postal_code = shipping_address.postal_code
      address_user_name = shipping_address.name
    else
      address = params[:order][:address]
    end
  end
end
