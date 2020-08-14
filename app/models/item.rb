class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to_active_hash :category 
  belongs_to_active_hash :sales_status
  belongs_to_active_hash :shipping_fee
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :scheduled_delivery
  validates :product_name, :info, :user_id, :image, presence: true

  with_options presence: true do
    validates :price, format: {with: /\A[0-9]+\z/, message: "is invalid. Input half-width characters."}
  end

  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "is out of setting range"}

  #validates :category_id, :sales_status_id, :shipping_fee_id, :prefecture_id, :scheduled_delivery_id


  #def save_item
  #  product = Item.create(product_name: product_name, info: info)
  #  item = Item.create(category_id: category_id, sales_status_id: sales_status_id, shipping_fee_id: shipping_fee_id, prefecture_id: prefecture_id, scheduled_delivery_id: scheduled_delivery_id)
  #  price = Item.create(price: price)

  #end

  belongs_to :user
  has_one    :item_purchase
  has_one    :shipping_address
  has_one_attached :image

  

end
