class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :decks, dependent: :destroy
  has_many :categories, through: :decks
  has_many :favorite_categories

  validates :username, presence: false
end
