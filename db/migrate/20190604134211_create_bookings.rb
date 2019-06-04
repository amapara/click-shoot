class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.references :sale_item, foreign_key: true
      t.date :start_date
      t.date :end_date
      t.references :user, foreign_key: true
      t.float :total_price
      t.string :pick_up_location
      t.string :drop_off_location

      t.timestamps
    end
  end
end
