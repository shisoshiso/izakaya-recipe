class CreateRecipes < ActiveRecord::Migration[6.0]
  def change
    create_table :recipes do |t|
      t.string :name, null:false
      t.text :material, null:false
      t.integer :alcohol_id, null:false
      t.integer :category_id, null:false
      t.integer :genre_id, null:false
      t.text :point
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
