class CreateSaleItems < ActiveRecord::Migration[5.2]
  def change
    create_table :sale_items do |t|
      t.string :model
      t.float :daily_rate
      t.float :set_up_rate
      t.references :user, foreign_key: true
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end
