class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  has_many :items
  has_one  :item_purchase

  with_options presence: true do
    validates :nickname, :birthday
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze
    VALID_NAME_REGEX = /\A[ぁ-んァ-ン一-龥]/.freeze
    VALID_FURIGANA_REGEX = /\A[ァ-ヶー－]+\z/.freeze
    VALID_PASSWORD_REGEX = /\A[a-z0-9]+\z/i.freeze

    validates :first_name, :family_name, format: { with: VALID_NAME_REGEX, message: "は漢字で入力してください。" }
    validates :furigana_first, :furigana_family,format: { with: VALID_FURIGANA_REGEX, message: "はカナで入力してください。"  }
    validates :password, format: { with: VALID_PASSWORD_REGEX , message: "半角英数で入力してください。"  }
   end
end
