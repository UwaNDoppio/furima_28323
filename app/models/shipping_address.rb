class ShippingAddress < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  
  belongs_to_active_hash :prefecture
  
  validates :city, :address, :phone_number,  presence: true
  
  include ActiveModel::Model
  attr_accessor :post_number, :prefecture, :city, :address, :building_name, :phone_number
  with_options presence: true do
      validates :post_number, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
      validates :prefecture, numericality: { other_than: 0, message: "can't be blank" }
      validates :phone_number, format: {with: /\A\d{11}\z/, message: "is invalid."}
  end
end
