class CreateSaleItems < ActiveRecord::Migration[5.2]
  def change
    create_table :sale_items do |t|
      t.string :model
      t.string :availability
      t.integer :daily_rate
      t.integer :setup_rate
      t.integer :user_id

      t.timestamps
    end
  end
end
