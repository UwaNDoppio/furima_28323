class ItemPurchasesController < ApplicationController
  before_action :move_to_index, except: [:index, :show, :edit, :new, :create]

  def index
    @items =Item.find(params[:item_id])
    @shipping_address = ShippingAddress.new
  end

  def new
  end


  def create
    @items =Item.find(params[:item_id])
    @items.update(soldout_status: 1) 
    @shipping_address = ShippingAddress.new(shipping_address_params)
    @shipping_address.item_id = @items.id
    if @shipping_address.valid?
       @shipping_address.save
       pay_item
       redirect_to root_path
    else
      render :index
    end
  end

  def show
  end

  private

  def shipping_address_params
    params.require(:shipping_address).permit( :post_number, :prefecture_id, :city, :address, :building_name, :phone_number)
  end

  def pay_item
    @items =Item.find(params[:item_id])
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # PAY.JPテスト秘密鍵
    Payjp::Charge.create(
      amount: @items[:price],  # 商品の値段
      card: params[:token],    # カードトークン
      currency:'jpy'                 # 通貨の種類(日本円)
    )
  end

  def save
    user = User.create(name: name)
    ShippingAddress.create(post_number:post_number,prefecture:prefecture,city:city,address:address,building_name:building_name,phone_number:phone_number,item_id:item_id)
  end
  

end
