class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :end_user_id, null: false
      t.string :address_user_name, null: false, default: ""
      t.string :postal_code, null: false, default: ""
      t.integer :order_status, null: false, default: 0
      t.integer :pastage, null: false, default: 0
      t.integer :payment_method, null: false, default: 0
      t.integer :payment, null: false, default:0
      t.string :address, null: false, default: ""

      t.timestamps
    end
  end
end
