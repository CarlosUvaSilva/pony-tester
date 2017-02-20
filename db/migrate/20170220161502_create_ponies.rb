class CreatePonies < ActiveRecord::Migration[5.0]
  def change
    create_table :ponies do |t|
      t.string :name
      t.string :color
      t.string :race
      t.integer :age
      t.integer :height
      t.text :description
      t.string :location
      t.integer :rating
      t.integer :user_id

      t.timestamps
    end
  end
end
