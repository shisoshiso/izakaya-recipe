json.extract! recipe, :id, :name, :material, :alcohol_id, :category_id, :genre_id, :point, :user_id, :created_at, :updated_at
json.url recipe_url(recipe, format: :json)
