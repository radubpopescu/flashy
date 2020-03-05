class Deck < ApplicationRecord
  belongs_to :user
  belongs_to :category
<<<<<<< HEAD
  has_many :cards, dependent: :destroy

  include PgSearch::Model
  pg_search_scope :global_search,
  against: [:name],
  associated_against:{
    user: [:email],
    category: [:name]
  },
  using: {
    tsearch: {prefix: true}
  }
=======
  validates :name, presence: true
>>>>>>> master
end
