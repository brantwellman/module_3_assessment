class Api::V1::ItemsController < ApplicationController
  respond_to :json

# need to remove created at and updated_at
  def index
    respond_with Item.all
  end

  # need to remove created at and updated_at
  def show
    respond_with Item.find(params[:id])
  end

  def create

  end

  def destroy
    respond_with Item.delete
  end

end
