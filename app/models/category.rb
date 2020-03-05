class Category < ApplicationRecord
  has_many :decks
  has_many :favorite_categories
end
