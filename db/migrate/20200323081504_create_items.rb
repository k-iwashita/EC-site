class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name, null: false, default: ""
      t.integer :price_excluding_tax, default: 0
      t.text :description, null: false, default: ""
      t.string :image_id, null:false, default: ""
      t.integer :sale_status, default: 0, null: false

      t.timestamps
    end
  end
end
