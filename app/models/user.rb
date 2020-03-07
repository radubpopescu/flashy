class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :decks, dependent: :destroy
  has_many :favorite_categories
  has_many :categories, through: :favorite_categories
  has_many :card_answers
  has_many :reviews, dependent: :destroy
end
