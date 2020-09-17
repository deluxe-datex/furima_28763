class Item < ApplicationRecord
  belongs_to :user, optional: true
  has_one :trading_history
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :burden
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :day

  with_options presence: true do
    validates :image, presence: { message: 'は一枚必須であること' }
    validates :product_name
    validates :description
    validates :category_id, numericality: { other_than: 1 ,message: 'を選択してください'}
    validates :status_id, numericality: { other_than: 1 ,message: 'を選択してください'}
    validates :burden_id, numericality: { other_than: 1 ,message: 'を選択してください'}
    validates :prefecture_id, numericality: { other_than: 1 ,message: 'を選択してください'}
    validates :day_id, numericality: { other_than: 1 ,message: 'を選択してください'}
    validates :price, numericality: { greater_than: 299, less_than: 10_000_000, message: 'は300以上9999999以下で入力してください' }
  end
end
