class Api::V1::ItemsController < ApplicationController
  respond_to :json

# need to remove created at and updated_at
  def index
    respond_with Item.all
  end

  # need to remove created at and updated_at - AR Serializers
  def show
    respond_with Item.find(params[:id])
  end

  def create
    item = Item.create(item_params)
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy
  end


  private

    def item_params
      params.require(:item).permit(:name, :description, :image_url)
    end

end
