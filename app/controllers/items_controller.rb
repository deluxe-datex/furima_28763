class ItemsController < ApplicationController
  before_action :login_check, only: :new

  def index
  end
  
  def new

  end

  private

  def login_check
    unless user_signed_in?
      
      redirect_to root_path
    end
  end

end
