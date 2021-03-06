class Item < ApplicationRecord
  belongs_to :genre
  has_many :cart_items, dependent: :destroy
  has_many :order_details, dependent: :destroy

  enum sale_status: { is_saled: 0, not_saled: 1 }
end
