class Genre < ApplicationRecord
  has_many :items

  enum valid_status: { is_valid: 0, is_invalid: 1 }
  validates :name, presence: true

  def add_item(item)
    items << item
  end
end
