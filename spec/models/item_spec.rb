require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '商品出品できるとき' do
      it '商品画像と商品名、商品の説明、カテゴリー、商品の状態、配送料の負担、発送元の地域、発送までの日数、価格の情報（半角数値）が存在すれば出品できる' do
        expect(@item).to be_valid
      end
    end
    context '商品出品できないとき' do
      it '商品画像が空では出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("画像を入力してください")
      end
      it '商品名が空では出品できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("商品名を入力してください")
      end
      it '商品名の説明が空では出品できない' do
        @item.text = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の説明を入力してください")
      end
      it 'カテゴリーが未選択だと出品できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("カテゴリーを選択してください")
      end
      it 'カテゴリーが「---」選択だと出品できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("カテゴリーを選択してください")
      end
      it '商品の状態が未選択だと出品できない' do
        @item.situation_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の状態を選択してください")
      end
      it '商品の状態が「---」選択だと出品できない' do
        @item.situation_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の状態を選択してください")
      end
      it '配送料の負担が未選択だと出品できない' do
        @item.delivery_charge_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("配送料の負担を選択してください")
      end
      it '配送料の負担が「---」選択だと出品できない' do
        @item.delivery_charge_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("配送料の負担を選択してください")
      end
      it '発送元の地域が未選択だと出品できない' do
        @item.prefecture_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("発送元の地域を選択してください")
      end
      it '発送元の地域が「---」選択だと出品できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("発送元の地域を選択してください")
      end
      it '発送までの日数が未選択だと出品できない' do
        @item.delivery_time_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("発送までの日数を選択してください")
      end
      it '発送までの日数が「---」選択だと出品できない' do
        @item.delivery_time_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("発送までの日数を選択してください")
      end
      it '価格の情報が空だと出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("価格を入力してください")
      end
      it '価格が¥300未満だと出品できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("価格は300以上の値にしてください")
      end
      it '価格が¥10,000,000以上だと出品できない' do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("価格は9999999以下の値にしてください")
      end
      it '価格の情報が全角文字で記入されていると出品できない' do
        @item.price = "３００"
        @item.valid?
        expect(@item.errors.full_messages).to include("価格は数値で入力してください")
      end
      it 'ユーザー情報が紐付いていないと出品できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("ユーザー情報を入力してください")
      end
    end
  end
end