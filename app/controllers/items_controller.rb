class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id].to_i)
  end

  def search
    service = BestbuyService.new(params["Search info:"])
    @product_data = service.products
  end
end
