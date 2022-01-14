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
        expect(@user.errors.full_messages).to include "Nickname can't be blank"
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Email can't be blank"
      end
      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include "Email has already been taken"
      end
      it 'emailに@が無ければ登録できない' do
        @user.email = 'test'
        @user.valid?
        expect(@user.errors.full_messages).to include "Email is invalid"
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Password can't be blank"
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = '00000'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password is too short (minimum is 6 characters)"
      end
      it 'passwordが英字のみでは登録できない' do
        @user.password = 'abcdef'
        @user.password_confirmation = 'abcdef'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password is invalid"
      end
      it 'passwordが数字のみでは登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password is invalid"
      end
      it 'passwordに全角文字が含まれている場合登録できない' do
        @user.password = 'ａbc123'
        @user.password_confirmation = 'ａbc123'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password is invalid"
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end
      it 'お名前(姓)(全角)が空では登録できない' do
        @user.real_name_two_byte_s = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Real name two byte s can't be blank"
      end
      it 'お名前(名)(全角)が空では登録できない' do
        @user.real_name_two_byte_p = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Real name two byte p can't be blank"
      end
      it 'お名前(姓)(全角)に半角文字が含まれている場合登録できない' do
        @user.real_name_two_byte_s = 'ﾔﾏﾀﾞ'
        @user.valid?
        expect(@user.errors.full_messages).to include "Real name two byte s is invalid"
      end
      it 'お名前(名)(全角)に半角文字が含まれている場合登録できない' do
        @user.real_name_two_byte_p = 'ﾘｸﾀﾛｳ'
        @user.valid?
        expect(@user.errors.full_messages).to include "Real name two byte p is invalid"
      end
      it 'お名前カナ(姓)(全角)が空では登録できない' do
        @user.real_name_kana_s = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Real name kana s can't be blank"
      end
      it 'お名前カナ(名)(全角)が空では登録できない' do
        @user.real_name_kana_p = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Real name kana p can't be blank"
      end
      it 'お名前カナ(姓)(全角)にカタカナ以外の文字が含まれている場合登録できない' do
        @user.real_name_kana_s = '山田'
        @user.valid?
        expect(@user.errors.full_messages).to include "Real name kana s is invalid"
      end
      it 'お名前カナ(名)(全角)にカタカナ以外の文字が含まれている場合登録できない' do
        @user.real_name_kana_p = '陸太郎'
        @user.valid?
        expect(@user.errors.full_messages).to include "Real name kana p is invalid"
      end
      it '生年月日が空では登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Birthday can't be blank"
      end
    end
  end
end