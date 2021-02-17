class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :recipes, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorited, through: :favorites, source: :recipe

  # フォロー・フォロワー機能
  has_many :relationships
  has_many :followings, through: :relationships, source: :follow
  has_many :reverse_of_relationships, class_name: 'Relationship', foreign_key: 'follow_id'
  has_many :followers, through: :reverse_of_relationships, source: :user

  def follow(other_user)
    unless self == other_user
      self.relationships.find_or_create_by(follow_id: other_user.id)
    end
  end

  def unfollow(other_user)
    relationship = self.relationships.find_by(follow_id: other_user.id)
    relationship.destroy if relationship
  end

  def following?(other_user)
    self.followings.include?(other_user)
  end


  # いいねしているかどうかを判定する
  def already_favorited?(recipe)
    self.favorites.exists?(recipe_id: recipe.id)
  end
  
  # バリデーションにemailの検証が必要かどうかを検証する
  def email_required?
    false
  end

  def email_changed?
    false
  end

  def will_save_change_to_email?
    false
  end
  # /バリデーションにemailの検証が必要かどうかを検証するメソッド

  # バリデーションの設定
  with_options presence: true do
    validates :nickname, length: { maximum: 30 }, uniqueness: { message: 'そのニックネームはすでに使用されています' } # uniqueはマイグレーションファイルに記述
    validates :password, format: { with: /\A(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]+\z/, message: 'は半角英数字混合での入力が必要です' }
  end
end
