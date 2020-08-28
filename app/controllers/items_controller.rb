class ItemsController < ApplicationController
  
  before_action :login_check, only: :new

  def index
  end
  
  def new
    @item = Item.new
    
  end

  def create
    @item = Item.new(item_params)
    @item.save
    if params[:item] && @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  


  private

  def login_check
    unless user_signed_in?
      redirect_to root_path
    end
  end

  def item_params
    params.require(:item).permit(:image, :product_name, :description, :category_id, :status_id, :burden_id, :prefecture_id, :day_id, :price).merge(user_id: current_user.id)
  end
end
