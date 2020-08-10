require 'rails_helper'
describe User, type:  :model do
  describe 'ユーザー情報' do
    it "ニックネームが必須であること" do
      user = User.new(nickname: "", email: "kkk@gmail.com", password: "00000000", password_confirmation: "00000000")
      user.valid?
      expect(user.errors.full_messages).to include("Nickname can't be blank")
    end
    it "メールアドレスが必須であること" do
      
    end
    it "メールアドレスが一意性であること" do
      
    end
    it "メールアドレスは＠を含む必要があること" do
      
    end
    it "パスワードが必須であること" do
      
    end
    it "パスワードは6文字以上であること" do
      
    end
    it "パスワードは半角英数字混合であること" do
      
    end
    it "パスワードは確認用を含めて２回入力すること" do
      
    end
  end
end