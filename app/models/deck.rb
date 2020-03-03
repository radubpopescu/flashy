class Deck < ApplicationRecord
  belongs_to :user
  belongs_to :category
  include PGSearch::Model
  pg_search_scope :global_search,
  against: [:name],
  associated_against: {
    user: [:email]
  }
end
