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
      @sale_items = SaleItem.where(city: params[:city])
    else
      @sale_items = SaleItem.all
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
    params.require(:sale_item).permit(:model, :set_up_rate, :daily_rate, :start_date, :end_date)
  end
end
