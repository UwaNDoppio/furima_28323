require 'rails_helper'
describe Item, type:  :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能実装条件' do
    it "ログインしているユーザーだけが、出品ページへ遷移できること" do
      @item.user = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("User must exist")
    end
    it "画像は1枚必須であること" do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank", "User must exist")
    end
    it "商品名が必須であること" do
      @item.product_name = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Product name can't be blank", "User must exist")
    end
    it "商品の説明が必須であること" do
      @item.info = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Info can't be blank")
    end
    it "カテゴリーの情報が必須であること" do
      @item.category = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("User must exist")
    end
    it "商品の状態についての情報が必須であること" do
      @item.sales_status = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("User must exist")
    end
    it "配送料の負担についての情報が必須であること" do
      @item.shipping_fee = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("User must exist")
    end
    it "発送元の地域についての情報が必須であること" do
      @item.prefecture = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("User must exist")
    end
    it "発送までの日数についての情報が必須であること" do
      @item.scheduled_delivery = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("User must exist")
    end
    it "価格についての情報が必須であること" do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("User must exist")
    end
  end
end