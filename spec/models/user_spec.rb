require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'nicknameとemail、passwordとpassword_confirmationが存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end
    context '新規登録できないとき' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "ニックネームを入力してください"
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "メールアドレスを入力してください"
      end
      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include "メールアドレスはすでに存在します"
      end
      it 'emailに@が無ければ登録できない' do
        @user.email = 'test'
        @user.valid?
        expect(@user.errors.full_messages).to include "メールアドレスは不正な値です"
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "パスワードを入力してください"
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = '00000'
        @user.valid?
        expect(@user.errors.full_messages).to include "パスワードは6文字以上で入力してください"
      end
      it 'passwordが英字のみでは登録できない' do
        @user.password = 'abcdef'
        @user.password_confirmation = 'abcdef'
        @user.valid?
        expect(@user.errors.full_messages).to include "パスワードは不正な値です"
      end
      it 'passwordが数字のみでは登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include "パスワードは不正な値です"
      end
      it 'passwordに全角文字が含まれている場合登録できない' do
        @user.password = 'ａbc123'
        @user.password_confirmation = 'ａbc123'
        @user.valid?
        expect(@user.errors.full_messages).to include "パスワードは不正な値です"
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "パスワード（確認用）とパスワードの入力が一致しません"
      end
      it 'お名前(姓)(全角)が空では登録できない' do
        @user.real_name_two_byte_s = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "お名前(全角)(名字)を入力してください"
      end
      it 'お名前(名)(全角)が空では登録できない' do
        @user.real_name_two_byte_p = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "お名前(全角)(名前)を入力してください"
      end
      it 'お名前(姓)(全角)に半角文字が含まれている場合登録できない' do
        @user.real_name_two_byte_s = 'ﾔﾏﾀﾞ'
        @user.valid?
        expect(@user.errors.full_messages).to include "お名前(全角)(名字)は不正な値です"
      end
      it 'お名前(名)(全角)に半角文字が含まれている場合登録できない' do
        @user.real_name_two_byte_p = 'ﾘｸﾀﾛｳ'
        @user.valid?
        expect(@user.errors.full_messages).to include "お名前(全角)(名前)は不正な値です"
      end
      it 'お名前カナ(姓)(全角)が空では登録できない' do
        @user.real_name_kana_s = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "お名前カナ(全角)(名字)を入力してください"
      end
      it 'お名前カナ(名)(全角)が空では登録できない' do
        @user.real_name_kana_p = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "お名前カナ(全角)(名前)を入力してください"
      end
      it 'お名前カナ(姓)(全角)にカタカナ以外の文字が含まれている場合登録できない' do
        @user.real_name_kana_s = '山田'
        @user.valid?
        expect(@user.errors.full_messages).to include "お名前カナ(全角)(名字)は不正な値です"
      end
      it 'お名前カナ(名)(全角)にカタカナ以外の文字が含まれている場合登録できない' do
        @user.real_name_kana_p = '陸太郎'
        @user.valid?
        expect(@user.errors.full_messages).to include "お名前カナ(全角)(名前)は不正な値です"
      end
      it '生年月日が空では登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "生年月日を入力してください"
      end
    end
  end
end