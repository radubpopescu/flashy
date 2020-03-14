class Deck < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :cards, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :card_answers, through: :cards
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

  def upvotes
    total = 0
    self.reviews.each do |review|
      total += 1 if review[:review_value].to_i == 1
    end
    total
  end

  def downvotes
    total = 0
    self.reviews.each do |review|
      total += 1 if review[:review_value].to_i == -1
    end
    total
  end

  def review_total
    total = 0
    self.reviews.each do |review|
      total += review[:review_value].to_i
    end
    total
  end

  def wrong_answers
    self.card_answers.where(answer: "-1").order(:card_id)
  end


end
