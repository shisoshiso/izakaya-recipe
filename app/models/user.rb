class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # バリデーションにemailの検証が必要かどうかを検証するメソッド
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

  has_many :recipes
  has_many :comments
  has_many :favorites, dependent: :destroy

  # いいねされているかを判定するメソッド
  def already_favorited?(recipe)
    self.favorites.exists?(recipe_id: recipe.id)
  end

  with_options presence: true do
    validates :nickname, length: { maximum: 30 }, uniqueness: { message: 'そのニックネームはすでに使用されています' } # uniqueはマイグレーションファイルに記述
    validates :password, format: { with: /\A(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]+\z/, message: 'は半角英数字混合での入力が必要です' }
  end
end
