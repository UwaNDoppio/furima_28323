class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string  :product_name,         null: false
      t.string  :info,                 null: false
      t.integer :category_id,             null: false
      t.integer :sales_status_id,         null: false
      t.integer :shipping_fee_id,         null: false
      t.integer :prefecture_id,           null: false
      t.integer :scheduled_delivery_id,   null: false
      t.integer :price,                null: false
      t.integer :user_id,             null: false
      t.boolean :soldout_status
      

      t.timestamps
    end
  end
end
