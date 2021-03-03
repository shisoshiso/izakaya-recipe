class Recipe < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_many :comments
  has_many :favorites
  has_many :favorited_users, through: :favorites, source: :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :genre
  belongs_to :alcohol

  with_options presence: true do
    validates :image
    validates :name, length: { maximum: 30 }
    validates :material
    validates :explanation
  end

  with_options presence: true, numericality: { other_than: 1, message: 'を選択してください' } do
    validates :alcohol_id
    validates :category_id
    validates :genre_id
  end

  # データ検索を行うメソッド
  def self.search(search)
    if search != ''
      Recipe.where('name LIKE(?)', "%#{search}%")
    else
      Recipe.all.order('created_at DESC')
    end
  end
  # /データ検索を行うメソッド
end
