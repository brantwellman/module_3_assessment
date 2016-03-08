class Api::V1::ItemsController < ApplicationController
  respond_to :json

  def index
    respond_with Item.all
  end

  def show

  end

  def create

  end

  def delete

  end

end
