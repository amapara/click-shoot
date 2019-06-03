class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.integer :sale_item_id
      t.string :dates_booked
      t.string :total_price
      t.string :pickup_location
      t.string :drop_off_location
      t.integer :user_id

      t.timestamps
    end
  end
end
