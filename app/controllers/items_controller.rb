class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :show, :edit, :new, :update, :create]
  before_action :set_item, only: [:edit, :show,:destroy]

  def index
    @items = Item.all.order(product_name: "DESC")
  end

  def new
    @items = Item.new
  end

  def create
    @items = Item.new(items_params)
    if @items.save
        redirect_to items_path(@items)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @items = Item.update(items_params)
        redirect_to item_path(items_params)
    else
      render :edit
    end
  end


  def show
  end

  def destroy
    if current_user.id == @items.user_id
      @items.destroy
      redirect_to root_path
    else
      render :show
    end
  end


  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end

  def set_item
    @items = Item.find(params[:id])
  end


  private

  def items_params
    params.require(:item).permit(:product_name, :info, :price, :category_id, :sales_status_id, :shipping_fee_id, :prefecture_id, :scheduled_delivery_id, :image).merge(user_id: current_user.id)
  end


end
