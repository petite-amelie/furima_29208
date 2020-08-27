require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー情報登録' do
    it "ニックネームが空だと登録できない" do
      @user.nickname = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it "メールアドレスが空だと登録できない" do
      @user.email = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it "既に登録されているメールアドレスは登録できない" do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end
    it "@が含まれていないとメールアドレスは登録できない" do
      @user.email = @user.email.sub(/@/,"")
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end
    it "パスワードが空だと登録できない" do
      @user.password = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it "パスワードは6文字以上でないと登録できない" do
      @user.password = Faker::Internet.password(min_length: 4, max_length: 5)
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end
    it "パスワードは半角数字だけだと登録できない" do
      @user.password = Faker::Number.number(digits: 10)
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end
    it "パスワードは半角英字だけだと登録できない" do
      @user.password = Faker::Alphanumeric.alpha(number: 10)
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end
    it "パスワードは確認用含めて2回入力しないと登録できない" do
      @user.password_confirmation =""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
  end

  describe '本人情報登録' do
    it "ユーザー本名が苗字が空では登録できない" do
      @user.family_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name can't be blank")
    end
    it "ユーザー本名が名前が空では登録できない" do
      @user.first_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end
    it "ユーザー本名の苗字が半角では登録できない" do
      @user.family_name = "ｱｱｱ"
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name is invalid")
    end
    it "ユーザー本名の名前が半角では登録できない" do
      @user.first_name = "ｱｱｱ"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name is invalid")
    end
    it "ユーザー本名の振り仮名が苗字が空では登録できない" do
      @user.family_name_furigana = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name furigana can't be blank")
    end
    it "ユーザー本名の振り仮名が名前が空では登録できない" do
      @user.first_name_furigana = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("First name furigana can't be blank")
    end
    it "ユーザー本名の振り仮名の苗字が半角では登録できない" do
      @user.family_name_furigana = "ｱｱｱ"
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name furigana is invalid")
    end
    it "ユーザー本名の振り仮名の名前が半角では登録できない" do
      @user.first_name_furigana = "ｱｱｱ"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name furigana is invalid")
    end
    it "生年月日が空では登録できない" do
      @user.birth_day = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Birth day can't be blank")
    end
  end
end
