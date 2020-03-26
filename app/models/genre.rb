class Genre < ApplicationRecord
  has_many :items

  enum valid_status: { 有効: 0, 無効: 1 }
  validates :name, presence: true

  def add_item(item)
    items << item
  end
end
