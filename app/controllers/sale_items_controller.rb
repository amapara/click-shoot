class SaleItemsController < ApplicationController
  def index
    @sale_items = SaleItem.all
  end

  def show
    @sale_item= SaleItem.find(params[:id])
  end
end
