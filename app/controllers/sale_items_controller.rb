class SaleItemsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def show
    @sale_item = SaleItem.find(params[:id])
  end

  def new
    @sale_item = SaleItem.new
  end

  def index
    if params[:city].present?
      @city = params[:city]
      @sale_items = SaleItem.where.not(latitude: nil, longitude: nil)
      @sale_items = SaleItem.where(city: params[:city])
      @markers = @sale_items.map do |sale_item|
      {
        lat: sale_item.latitude,
        lng: sale_item.longitude
      }
      end
    else
      @sale_items = SaleItem.all
      @markers = @sale_items.map do |sale_item|
      {
        lat: sale_item.latitude,
        lng: sale_item.longitude
      }
      end

    end
  end

  def create
    @sale_item = SaleItem.new(sale_items_params)
    @sale_item.user = current_user

    if @sale_item.save
      redirect_to sale_items_path
    else
      render :new
    end
  end

  private

  def sale_items_params
    params.require(:sale_item).permit(:model, :set_up_rate, :daily_rate, :start_date, :end_date, :city, :photo)
  end
end
