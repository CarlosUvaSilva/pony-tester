class AddMostRecentToPonyOffers < ActiveRecord::Migration[5.0]
  def change
    add_column :pony_offers, :most_recent, :boolean
  end
end
