require 'rails_helper'
describe User do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '全部の条件が一致していれば登録できる' do
      it "nickname、email、password、password_confirmation、first_name、last_name、kanafirst_name、kanamiddle_name、birthday存在すれば登録できる" do
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it "nicknameが空だと登録できない" do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "emailが空では登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "@を含まないと登録できない" do
        @user.email = "test.com"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it "重複したemailが存在する場合登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it "passwordが空では登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "英数字混合だが、字数が5文字以下の場合、登録できない" do
        @user.password = "00000"
        @user.password_confirmation = "00000"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it "passwordが存在してもpassword_confirmationが空では登録できない" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "passwordが半角数字のみの場合は登録できない" do
        @user.password = '1111111'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it "passwordが半角英字のみの場合は登録できない" do
        @user.password = 'aaaaaaa'
        @user.valid?
        binding.pry
        expect(@user.errors.full_messages).to include("Password is invalid")
      end


      it "ユーザー本名は、名字は必須でないと登録できない" do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it "ユーザー本名は、名前は必須でないと登録できない" do
        @user.last_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it "ユーザー本名、名字は全角（漢字・ひらがな・カタカナ）での入力が必須でないと登録できない" do
        @user.first_name= "aaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid")
      end
      it "ユーザー本名、名前は全角（漢字・ひらがな・カタカナ）での入力が必須でないと登録できない" do
        @user.last_name= "aaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name is invalid")
      end


      it "ユーザー本名のフリガナは、名字が必須であること" do
        @user.kanafirst_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Kanafirst name can't be blank")
      end
      it "ユーザー本名のフリガナは、名前が必須であること" do
        @user.kanamiddle_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Kanamiddle name can't be blank")
      end
      it "ユーザー本名の名字フリガナは、全角（カタカナ）での入力が必須であること" do
        @user.kanafirst_name = "あ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Kanafirst name is invalid")
      end
      it "ユーザー本名の名前フリガナは、全角（カタカナ）での入力が必須であること" do
        @user.kanamiddle_name = "あ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Kanamiddle name is invalid")
      end
      it "生年月日が必須であること" do
          @user.birthday = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end