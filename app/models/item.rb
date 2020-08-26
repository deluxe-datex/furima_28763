class Item < ApplicationRecord
  belongs_to :user
  has_one :trading_history
end
