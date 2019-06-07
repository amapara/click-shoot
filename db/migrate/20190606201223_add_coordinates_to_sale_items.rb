class AddCoordinatesToSaleItems < ActiveRecord::Migration[5.2]
  def change
    add_column :sale_items, :latitude, :float
    add_column :sale_items, :longitude, :float
  end
end
