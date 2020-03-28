class EndUser < ApplicationRecord
  has_many :cart_items, dependent: :destroy
  has_many :orders
  has_many :shipping_addresses

  acts_as_paranoid

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
