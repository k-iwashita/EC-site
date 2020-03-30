class EndUser < ApplicationRecord
  has_many :cart_items, dependent: :destroy
  has_many :orders
  has_many :shipping_addresses

  validates :family_name, presence: true
  validates :last_name, presence: true
  validates :family_name_kana, presence: true
  validates :last_name_kana, presence: true
  validates :phone_number, presence: true
  validates :postal_code_home, presence: true
  validates :address_home, presence: true




  acts_as_paranoid

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
