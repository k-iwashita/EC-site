class Item < ApplicationRecord
  belongs_to :genre
  has_many :cart_items, dependent: :destroy

  enum sale_status: { 販売中: 0, 販売中止: 1 }
end
