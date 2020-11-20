require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    before do
      @user = FactoryBot.build(:user)
    end

    context 'ユーザー新規登録できる時' do

      it "nicknameとemail、passwordとpassword_confirmation、last_nameとfirst_name、last_name_readingとfirst_name_reading、birthdayが存在すれば登録できること" do
        expect(@user).to be_valid
      end

    end

    context 'ユーザー新規登録できない時' do

      it "nicknameが空では登録できないこと" do
        @user.nickname = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it "emailが空では登録できないこと" do
        @user.email = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it "passwordが空では登録できないこと" do
        @user.password = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it "passwordが英数字混合だが、5文字以下であれば登録できないこと" do
        @user.password = "123ab"
        @user.password_confirmation = "123ab"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end

      it "passwordとpassword_confirmationが不一致では登録できないこと" do
        @user.password = "123456"
        @user.password_confirmation = "1234567"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it "重複したemailが存在する場合登録できないこと" do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end

      it "emailは@が存在しない場合登録できないこと" do
        @user.email = "aaaaaaaaaaaa.com"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end

      it "passwordが英数字混合でなければ登録できないこと(英字のみ)" do
        @user.password = "aaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid. Password Include both letters and numbers")
      end

      it "passwordが英数字混合でなければ登録できないこと(数字のみ)" do
        @user.password = "111111"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid. Password Include both letters and numbers")
      end

      it "first_nameが空では登録できないこと" do
        @user.first_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank", "First name is invalid. Input full-width characters.")
      end

      it "last_nameが空では登録できないこと" do
        @user.last_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank", "Last name is invalid. Input full-width characters.")
      end

      it "first_nameが全角（漢字・ひらがな・カタカナ）でなければ登録できないこと" do
        @user.first_name = "ﾀﾛｳ"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid. Input full-width characters.")
      end

      it "last_nameが全角（漢字・ひらがな・カタカナ）でなければ登録できないこと" do
        @user.last_name = "ﾔﾏﾀﾞ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name is invalid. Input full-width characters.")
      end

      it "first_name_readingが空では登録できないこと" do
        @user.first_name_reading = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("First name reading can't be blank", "First name reading is invalid. Input full-width katakana characters.")
      end

      it "last_name_readingが空では登録できないこと" do
        @user.last_name_reading = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name reading can't be blank", "Last name reading is invalid. Input full-width katakana characters.")
      end

      it "first_name_readingが全角（カタカナ）でなければ登録できないこと" do
        @user.first_name_reading = "ﾀﾛｳ"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name reading is invalid. Input full-width katakana characters.")
      end

      it "last_name_readingが全角（カタカナ）でなければ登録できないこと" do
        @user.last_name_reading = "ﾔﾏﾀﾞ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name reading is invalid. Input full-width katakana characters.")
      end

      it "birthdayが空では登録できないこと" do
        @user.birthday = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end

    end
  end
end
