class Card < ApplicationRecord
  belongs_to :deck
  has_many :card_answers, dependent: :destroy

  def next_card(wrong = false)
    if wrong == "true"
      card_answer = self.deck.wrong_answers.where("card_answers.card_id > ?", self.id).first
      card_answer ? card_answer.card : nil
    else
      Card.where("cards.id > ?", self.id).where(deck: self.deck).first
    end
  end
end
