class ItemPurchasesController < ApplicationController


  def show
    @items = Item.new
  end



  def done
    @item_purchase = Item.find(params[:id])
    @item_purchase.update(item_purchase_id: current_user.id)
  end

end
