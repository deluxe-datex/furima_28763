class TradingDestination

  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefecture_id, :city, :address, :building_name, :phone_number, :token

  with_options presence: true do
    validates :token
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message:'はハイフンが必要であること' }
    validates :prefecture_id, numericality: { other_than: 1 ,message: 'を選択してください'}
    validates :city
    validates :address
    validates :phone_number, format: { with: /\A\d{10}$|^\d{11}\z/, message:'はハイフンは不要で、11桁以内であること' }
  end
    
    

  def save
    user = User.find(user_id)
    trading = TradingHistory.create(user: user, item_id: item_id )
    Destination.create(trading_history_id: trading.id, postal_code: postal_code, prefecture_id: prefecture_id, city: city, address: address, building_name: building_name, phone_number: phone_number)
  end
end