require 'rails_helper'
describe ShippingAddress, type:  :model do
  before do
    @shipping_address = FactoryBot.build(:shipping_address)
  end

  describe '商品購入機能実装条件' do
    it "配送先の情報として、配送先の情報として、郵便番号が必須であることが必須であること" do
      @shipping_address.post_number = nil
      @shipping_address.valid?
      expect(@shipping_address.errors.full_messages).to include("Post number can't be blank")
    end

    it "配送先の情報として、都道府県が必須であること" do
      @shipping_address.prefecture_id = nil
      @shipping_address.valid?
      expect(@shipping_address.errors.full_messages).to include("Prefecture can't be blank")
    end

    it "配送先の情報として、市区町村が必須であること" do
      @shipping_address.city = nil
      @shipping_address.valid?
      expect(@shipping_address.errors.full_messages).to include("City can't be blank")
    end

    it "配送先の情報として、番地が必須であること" do
      @shipping_address.address = nil
      @shipping_address.valid?
      expect(@shipping_address.errors.full_messages).to include("Address can't be blank")
    end

    it "配送先の情報として、電話番号が必須であること" do
      @shipping_address.phone_number = nil
      @shipping_address.valid?
      expect(@shipping_address.errors.full_messages).to include("Phone number can't be blank")
    end
  end
end