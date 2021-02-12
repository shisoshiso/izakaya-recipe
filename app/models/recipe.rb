class Recipe < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  
  with_options presence: true do
    validates :name, length: {maximum: 30}
    validates :material
    validates :alcohol_id
    validates :category_id
    validates :genre_id
  end

end
