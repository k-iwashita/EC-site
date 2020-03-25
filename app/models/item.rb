class Item < ApplicationRecord
  belongs_to :genre

  enum sale_status: { 販売中: 0, 販売中止: 1 }
end
