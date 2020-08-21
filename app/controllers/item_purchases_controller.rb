class ItemPurchasesController < ApplicationController
  before_action :move_to_index, except: [:index, :show, :edit, :new]
  
  def index
    @item_purchase = Item_purchase.find(params[:item.items_id])
  end

  def new
  end


  def create
    @item_purchase = ItemPurchases.new(price: item_purchases_params[:price])
    if @item_purchase.valid?
      pay_item
      @item_purchase.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  def show
  end

  private

  def item_purchases_params
    params.permit(:price, :token)
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # PAY.JPテスト秘密鍵
    Payjp::Charge.create(
      amount: item_purchases_params[:price],  # 商品の値段
      card: item_purchases_params[:token],    # カードトークン
      currency:'jpy'                 # 通貨の種類(日本円)
    )
  end

end
