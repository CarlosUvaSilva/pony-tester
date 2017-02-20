class CreateBookings < ActiveRecord::Migration[5.0]
  def change
    create_table :bookings do |t|
      t.integer :pony_offer_id
      t.integer :user_id
      t.date :start_date
      t.date :end_date
      t.float :price

      t.timestamps
    end
  end
end
