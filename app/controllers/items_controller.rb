class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :show, :edit]

  def index
    @itmes = Item.order(product_name: "DESC")
  end

  def new
    
  end

  def edit
  end

  def show
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end



end
