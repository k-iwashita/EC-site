class Order < ApplicationRecord
  has_many :order_details
  belongs_to :end_user

  enum payment_method: { クレジットカード: 0, 銀行振込: 1 }
  enum order_status: { 入金待ち: 0, 入金確認: 1,
                       製作中: 2, 発送準備中: 3, 発送済み: 4 }

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
