class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @sale_items = SaleItem.all
  end
end
