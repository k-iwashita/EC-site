class CreateOrderDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :order_details do |t|
      t.integer :order_id, null: false
      t.integer :item_id, null: false
      t.integer :amount, null: false, default: 0
      t.integer :production_status, null: false, default: 0
      t.integer :purchased_price, null: false, default: 0

      t.timestamps
    end
  end
end
