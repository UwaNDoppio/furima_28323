require 'rails_helper'
describe User, type:  :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe 'ユーザー情報' do
    it "ニックネームが必須であること" do
      @user.nickname = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it "メールアドレスが必須であること" do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it "メールアドレスが一意性であること" do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end
    it "メールアドレスは＠を含む必要があること" do
      @user.email = "123456"
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end
    it "パスワードが必須であること" do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it "パスワードは6文字以上であること" do
      
      @user.password = "00000"
      @user.password_confirmation = "00000"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end
    it "パスワードは半角英数字混合であること" do
      @user.password = "トトロさつき"
      @user.password_confirmation = "トトロさつき"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password 半角英数で入力してください。")
    end
    it "パスワードは確認用を含めて２回入力すること" do
      @user.password_confirmation = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
  end

  describe '本人情報確認' do
    it "ユーザー本名が、名前必須であること" do
      @user.first_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end

    it "ユーザー本名が、名字必須であること" do
      @user.family_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name can't be blank")
    end

    it "ユーザー本名は全角（漢字・ひらがな・カタカナ）で入力させること" do
      @user.family_name = "Tarou"
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name は漢字で入力してください。")
    end

    it "ユーザー本名は全角（漢字・ひらがな・カタカナ）で入力させること" do
      @user.first_name = "Yamada"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name は漢字で入力してください。")
    end

    it "ユーザー本名のフリガナが、名字と名前でそれぞれ必須であること" do
      @user.furigana_family = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Furigana family はカナで入力してください。")
    end

    it "ユーザー本名のフリガナは全角（カタカナ）で入力させること" do
      @user.furigana_first = "Tarou"
      @user.valid?
      expect(@user.errors.full_messages).to include("Furigana first はカナで入力してください。")
    end

    it "生年月日が必須であること" do
      @user.birthday = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end

  end
end