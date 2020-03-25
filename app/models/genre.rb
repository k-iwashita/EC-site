class Genre < ApplicationRecord
  has_many :items

  def add_item(item)
    items << item
  end
end
