class BookingsController < ApplicationController

  def index
    @sale_item = SaleItem.find(params[:sale_item_id])
    @bookings = @sale_item.bookings
  end

  def new
    @sale_item = SaleItem.find(params[:sale_item_id])
    @booking = Booking.new
  end

  def create
    @sale_item = SaleItem.find(params[:sale_item_id])
    @booking = Booking.new(booking_params)
    @booking.sale_item = @sale_item
    time_period = (@booking.end_date - @booking.start_date).to_i

    total_rate = (time_period * @sale_item.daily_rate) + @sale_item.set_up_rate
    @booking.user = current_user
    @booking.total_price = total_rate
    if @booking.save
      redirect_to sale_item_booking_path(@sale_item, @booking)
    else
      render :new
    end
  end

  def show
    @sale_item = SaleItem.find(params[:sale_item_id])
    @booking = Booking.find(params[:id])
  end

  private

  def booking_params
    params.require(:booking).permit(:pick_up_location, :drop_off_location, :start_date, :end_date)
  end

end


