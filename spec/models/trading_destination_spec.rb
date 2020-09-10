require 'rails_helper'

RSpec.describe TradingDestination, type: :model do
  before do
    @trading_destination = FactoryBot.build(:trading_destination)
  end

  describe '商品購入機能' do
    context '商品の購入がうまくいくとき' do
      it 'カード情報、郵便番号、都道府県、市区町村、番地、電話番号が存在すれば購入できる' do
        expect(@trading_destination).to be_valid
      end
    end

    context '商品購入がうまくいかなとき' do
      it 'カード情報が必須である' do
        @trading_destination.token = ""
        @trading_destination.valid?
      end
      it '郵便番号が必須である' do
        @trading_destination.postal_code = ""
        @trading_destination.valid?
      end
      it '郵便番号にはハイフンが必要であること' do
        @trading_destination.postal_code = "1234567"
        @trading_destination.valid?
      end
      it '都道府県が必須である' do
        @trading_destination.prefecture_id = ""
        @trading_destination.valid?
      end
      it '市区町村が必須である' do
        @trading_destination.city = ""
        @trading_destination.valid?
      end
      it '番地が必須である' do
        @trading_destination.address
        @trading_destination.valid?
      end
      it '建物名は空でも保存ができる' do
        @trading_destination.building_name = nil
        expect(@trading_destination).to be_valid
      end
      it '電話番号が必須である' do
        @trading_destination.phone_number = ""
        @trading_destination.valid?
      end
      it '電話番号はハイフンは不要で11桁以内であること' do
        @trading_destination.phone_number = "123-4567-89012"
        @trading_destination.valid?
      end
    end
  end
end
