class AddCoordinatesToPonies < ActiveRecord::Migration[5.0]
  def change
    add_column :ponies, :latitude, :float
    add_column :ponies, :longitude, :float
  end
end
