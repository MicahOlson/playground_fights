class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name
      t.string :description
      t.integer :health_bonus

      t.timestamps null: false

      create_table :characters_items, id: false do |t|
        t.belongs_to :characters, index: true
        t.belongs_to :items, index: true
      end
    end
  end
end
