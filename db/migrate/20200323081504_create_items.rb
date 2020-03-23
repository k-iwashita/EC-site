class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name
      t.integer :price_excluding_tax
      t.text :description
      t.string :image_id
      t.boolean :is_saled?

      t.timestamps
    end
  end
end
