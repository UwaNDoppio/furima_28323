class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string  :product_name,         null: false
      t.string  :info,                 null: false
      t.integer :category,             null: false
      t.integer :sales_status,         null: false
      t.integer :shipping_fee,         null: false
      t.integer :pregecture,           null: false
      t.integer :scheduled_delivery,   null: false
      t.integer :price,                null: false

      t.timestamps
    end
  end
end
