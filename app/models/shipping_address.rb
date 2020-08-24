class ShippingAddress < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  
  belongs_to_active_hash :prefecture
  
  validates :city, :address, :item_id, presence: true

  belongs_to :user, optional: true
  belongs_to :item
  
  with_options presence: true do
    VALID_POST_CODE_REGEX = /\A[0-9]{3}-[0-9]{4}\z/.freeze
    VALID_PHONE_NUMBER_REGEX = /\A\d{10}$|^\d{11}\z/.freeze

      validates :post_number, format: {with: VALID_POST_CODE_REGEX, message: "is invalid. Include hyphen(-)"}
      validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
      validates :phone_number, format: {with: VALID_PHONE_NUMBER_REGEX , message: "is invalid."}
  end

  
end
