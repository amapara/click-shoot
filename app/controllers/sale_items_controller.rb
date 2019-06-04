class SaleItemsController < ApplicationController
  def index
    @sale_items = SaleItem.all
  end
end
