class ChangeColumnNameCharacters < ActiveRecord::Migration[5.2]
  def change
    rename_column :characters, :class, :role
    rename_column :enemies, :class, :bully
  end
end
