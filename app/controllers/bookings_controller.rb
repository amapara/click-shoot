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
  @booking.start_date = @sale_item.start_date
  @booking.end_date = @sale_item.end_date
  time_period = (@sale_item.end_date - @sale_item.start_date).to_i

total_rate = (time_period * @sale_item.daily_rate) + @sale_item.set_up_rate
  @booking.user = current_user
  @booking.total_price = total_rate
  if @booking.save
    redirect_to sale_items_path
  else
    render :new
    end

end

private

def booking_params
  params.require(:booking).permit(:pick_up_location, :drop_off_location)
end

end




