require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it 'nameとemail,passwordとpassword_confirmation,お名前,お名前カナ,生年月日が存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it 'nameが必須であること' do
        @user.name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("ニックネームを入力してください")
      end

      it 'メールアドレスが必須であること' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールを入力してください")
      end

      it 'メールアドレスは一意性であること' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Eメールはすでに存在します")
      end

      it 'メールアドレスは@を含む必要があること' do
        @user.email = 'aaagmail.com'
        @user.valid?
      end

      it 'パスワードが必須であること' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードを入力してください")
      end

      it 'パスワードは６文字以上であること' do
        @user.password = '00000'
        @user.password_confirmation = '00000'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは6文字以上で入力してください")
      end

      it 'パスワードは半角英数字混合であること' do
        @user.password = '0000000'
        @user.valid?
      end

      it 'パスワードは確認用を含めて２回入力すること' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end

      it 'ユーザー本名が、名字と名前がそれぞれ必須であること' do
        @user.family_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("姓を入力してください")
      end

      it 'ユーザー本名が、名字と名前がそれぞれ必須であること' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("名前を入力してください")
      end

      it 'ユーザー本名は全角で入力させること' do
        @user.family_name = 'yamada'
        @user.valid?
        expect(@user.errors.full_messages).to include("姓は全角(漢字・ひらがな・カタカナ)で入力してください")
      end

      it 'ユーザー本名は全角で入力させること' do
        @user.first_name = 'yamada'
        @user.valid?
        expect(@user.errors.full_messages).to include("名前は全角(漢字・ひらがな・カタカナ)で入力してください")
      end

      it 'ユーザー本名のフリガナ（漢字・ひらがな・カタカナ）が、名字と名前がそれぞれ必須であること' do
        @user.family_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("姓(カナ)を入力してください")
      end

      it 'ユーザー本名のフリガナ（漢字・ひらがな・カタカナ）が、名字と名前がそれぞれ必須であること' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("名前(カナ)を入力してください")
      end

      it 'ユーザー本名のフリガナは全角で（カタカナ）で入力させること' do
        @user.family_name_kana = '山田'
        @user.valid?
        expect(@user.errors.full_messages).to include('姓(カナ)はカタカナで入力してください')
      end

      it 'ユーザー本名のフリガナは全角で（カタカナ）で入力させること' do
        @user.first_name_kana = '太郎'
        @user.valid?
        expect(@user.errors.full_messages).to include('名前(カナ)はカタカナで入力してください')
      end

      it '生年月日が必須であること' do
        @user.birth_day = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("生年月日を入力してください")
      end
    end
  end
end
