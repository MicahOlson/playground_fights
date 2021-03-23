class CreateEnemies < ActiveRecord::Migration[5.2]
  def change
    create_table :enemies do |t|
      t.string :name
      t.string :class
      t.integer :health
      t.integer :location_id
      t.integer :item_id

      t.timestamps null: false
    end
  end
end
