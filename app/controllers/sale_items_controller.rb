class SaleItemsController < ApplicationController

  def new
    @sale_item = SaleItem.new
  end

  def index
    if params[:city].nil?
      @sale_items = SaleItem.all
    else
      @sale_items = SaleItem.where(city: params[:city])
    end
  end

  def show
    @sale_item = SaleItem.find(params[:id])
  end
end
