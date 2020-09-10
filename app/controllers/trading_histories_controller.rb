class TradingHistoriesController < ApplicationController 
  before_action :authenticate_user!
  
  def index
    @trading = TradingDestination.new
    @item = Item.find(params[:item_id])
    if @item.user == current_user
      redirect_to root_path
    end

    if @item.trading_history != nil
      redirect_to root_path
    end
  end

  def create
    @item = Item.find(params[:item_id])
    @trading = TradingDestination.new(trading_params)
    if @trading.valid?
      @trading.save 
      pay_item
      return redirect_to root_path
    else
      render :index
    end
  end

  private

  def trading_params
    params.permit(:postal_code, :prefecture_id, :city, :address, :building_name, :phone_number,:item_id,:token).merge(user_id: current_user.id)
  end

  def pay_item
    @item = Item.find(params[:item_id])
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: trading_params[:token],
      currency:'jpy'
    )
  end
end
