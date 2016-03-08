class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id].to_i)
  end

  def new_item_search

    redirect_to search_path
  end

  def search
    service = BestbuyService.new(params["Search info:"])
    @product_data = service.products
  end
end
