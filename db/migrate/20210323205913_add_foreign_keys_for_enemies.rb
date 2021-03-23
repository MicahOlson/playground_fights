class AddForeignKeysForEnemies < ActiveRecord::Migration[5.2]
  def change
    add_foreign_key :enemies, :items
    add_foreign_key :enemies, :locations
  end
end
