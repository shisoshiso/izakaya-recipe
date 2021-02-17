class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :recipe

  # Favoritesテーブルで,同一のuser_idに対するpost_idは一つだけ
  validates_uniqueness_of :recipe_id, scope: :user_id
end
