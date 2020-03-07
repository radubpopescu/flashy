class CardsController < ApplicationController
  def index
  end

  def show
    # raise
    @deck = Deck.find(params["deck_id"])
    @card = @deck.cards.find(params["id"])
    @count_card = @deck.cards.last.id - @card.id + 1
    @percentage = (@deck.cards.count - @count_card)/(@deck.cards.count)
    raise
  end
end
