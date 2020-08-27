class Item < ApplicationRecord

  belongs_to :user
  has_one :trading_history
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :burden
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :day

  with_options presence: true do
    validates :image, presence: {message: '画像は一枚必須であること'}
    validates :name
    validates :description
    validates :category_id, numericality: { other_than: 1 }
    validates :status_id, numericality: { other_than: 1 }
    validates :burden_id, numericality: { other_than: 1 }
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :day_id, numericality: { other_than: 1 }
    validates :price, numericality: {greater_than: 299, less_than: 10000000, message: '300以上9999999以下で入力してください'}
  end
end
