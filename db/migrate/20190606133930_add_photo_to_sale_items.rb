class AddPhotoToSaleItems < ActiveRecord::Migration[5.2]
  def change
    add_column :sale_items, :photo, :string
  end
end
