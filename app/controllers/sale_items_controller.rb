class SaleItemsController < ApplicationController

  def new
    @sale_item = SaleItem.new
  end

  def index
    @sale_items = SaleItem.all
  end

  def show
    @sale_item = SaleItem.find(params[:id])
  end
end
