class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :item

  enum production_status: { cannot_start: 0,
                            before_production: 1,
                            in_production: 2,
                            after_production: 3
                          }
end
