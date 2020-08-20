class ItemPurchasesController < ApplicationController

  def index
    #@item_purchase = Item_purchase.find(params[:items_id])
  end

  def new
  end


  def create
  end

  def show
  end



  def done
    @item_purchase = Item.find(params[:id])
    @item_purchase.update(item_purchase_id: current_user.id)
  end

end
