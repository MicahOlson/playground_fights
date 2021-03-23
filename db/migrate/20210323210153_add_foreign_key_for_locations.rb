class AddForeignKeyForLocations < ActiveRecord::Migration[5.2]
  def change
    add_foreign_key :locations, :enemies
  end
end
