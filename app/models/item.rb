class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category

  belongs_to :user
  has_one :trading_history
  has_one_attached :image

  validates :name, presence: true
  validates :category_id, numericality: { other_than: 1 } 
end
