class CreatePonyOffers < ActiveRecord::Migration[5.0]
  def change
    create_table :pony_offers do |t|
      t.integer :pony_id
      t.date :start_date
      t.date :end_date
      t.float :daily_rate

      t.timestamps
    end
  end
end
