class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :recipes
  has_many :comments

  validates :nickname, presence: true, length: {maximum: 30} #uniqueはマイグレーションファイルに記述
end
