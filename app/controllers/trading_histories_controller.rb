class TradingHistoriesController < ApplicationController 
  before_action :authenticate_user!
  
  def index
    @item = Item.find(params[:item_id])
    if @item.user == current_user
      redirect_to root_path
    end
  end
end
