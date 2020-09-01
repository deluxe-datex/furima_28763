require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload('public/images/test_image.png')
  end

  describe '商品出品' do
    context '商品がうまく出品できるとき' do
      it '出品画像、商品名、商品説明、カテゴリー、商品の状態、配送料負担、発送元地域、発送日数、販売価格が存在すれば出品できる' do
        expect(@item).to be_valid
      end
    end

    context '商品出品がうまくいかないとき' do
      it '画像が一枚必須であること' do
        @item.image = nil
        @item.valid?
      end
      it '商品名が必須であること' do
        @item.product_name = ''
        @item.valid?
      end
      it '商品の説明が必須であること' do
        @item.description = ''
        @item.valid?
      end
      it 'カテゴリーの情報が必須であること' do
        @item.category_id = ''
        @item.valid?
      end
      it '商品の状態について情報が必須であること' do
        @item.status_id = ''
        @item.valid?
      end
      it '配送料の負担についての情報が必須であること' do
        @item.burden_id = ''
        @item.valid?
      end
      it '発送元の地域についての情報が必須であること' do
        @item.prefecture_id = ''
        @item.valid?
      end
      it '発送までの日数についての情報が必須であること' do
        @item.day_id = ''
        @item.valid?
      end
      it '販売価格が、¥300~9,999,999の間であること' do
        @item.price = '299'
        @item.price = '10000000'
        @item.valid?
      end
    end
  end
end
