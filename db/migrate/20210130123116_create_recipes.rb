class CreateRecipes < ActiveRecord::Migration[6.0]
  def change
    create_table :recipes do |t|
      t.string :name
      t.text :material
      t.integer :alcohol_id
      t.integer :category_id
      t.integer :genre_id
      t.text :point
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
