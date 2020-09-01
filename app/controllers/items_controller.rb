class ItemsController < ApplicationController
  before_action :login_check, only: :new
  before_action :set_item, only: [:show, :edit]

  def index
    @items = Item.all.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.save
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    
  end

  def edit
    
  end

  #def destroy
    #@item = Item.find(params[:id])
    #@item.destroy
    #redirect_to root_path
  #end

  private

  def login_check
    redirect_to root_path unless user_signed_in?
  end

  def item_params
    params.require(:item).permit(:image, :product_name, :description, :category_id, :status_id, :burden_id, :prefecture_id, :day_id, :price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
