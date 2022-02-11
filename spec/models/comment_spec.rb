require 'rails_helper'

RSpec.describe Comment, type: :model do
  before do
    @comment = FactoryBot.build(:comment)
  end

  describe 'コメント投稿' do
    context 'コメント投稿できるとき' do
      it 'コメント文があり、ユーザー情報と商品情報が紐付いていれば投稿できる' do
        expect(@comment).to be_valid
      end
    end
    context 'コメント投稿できないとき' do
      it 'コメント文が空では投稿できない' do
        @comment.text = ''
        @comment.valid?
        expect(@comment.errors.full_messages).to include("コメント文を入力してください")
      end
      it 'ユーザー情報が紐付いていないと投稿できない' do
        @comment.user = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include("ユーザー情報を入力してください")
      end
      it '商品情報が紐付いていないと投稿できない' do
        @comment.item = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include("商品情報を入力してください")
      end
    end
  end
end