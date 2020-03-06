class CardsController < ApplicationController
  def index
  end

  def show
    # raise
    @deck = Deck.find(params["deck_id"])
    @card = @deck.cards.find(params["id"])
  end
end
