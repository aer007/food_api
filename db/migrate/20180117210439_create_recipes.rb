class CreateRecipes < ActiveRecord::Migration[5.1]
  def change
    create_table :recipes do |t|
      t.string :name
      t.integer :time
      t.string :image
      t.text :instructions

      t.timestamps
    end
  end
end
