class Deck < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :cards, dependent: :destroy
  has_many :reviews, dependent: :destroy
  validates :name, presence: true

  include PgSearch::Model
  pg_search_scope :global_search,
  against: [:name, :description],
  associated_against:{
    user: [:email],
    category: [:name]
  },
  using: {
    tsearch: {prefix: true}
  }
end
