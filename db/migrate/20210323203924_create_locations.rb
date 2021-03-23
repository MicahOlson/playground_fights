class CreateLocations < ActiveRecord::Migration[5.2]
  def change
    create_table :locations do |t|
      t.string :name
      t.string :description
      t.integer :enemy_id

      t.timestamps null: false
    end
  end
end
