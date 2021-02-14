class Recipe < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :genre
  belongs_to :alcohol
  
  with_options presence: true do
    validates :name, length: {maximum: 30}
    validates :material
    validates :explanation
  end

  with_options presence: true, numericality: { other_than: 1 } do
    validates :alcohol_id
    validates :category_id
    validates :genre_id
  end
end
