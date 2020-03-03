class FavoriteDeck < ApplicationRecord
  belongs_to :user
  belongs_to :deck
end
