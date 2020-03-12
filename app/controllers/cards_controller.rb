class CardsController < ApplicationController
  def index
    @cards = Card.all
  end

  def show
      @deck = Deck.find(params["deck_id"])
      @card = @deck.cards.find(params["id"])
      @count_cards = session[:cards_count]
      @current_card = session[:current_card]
      @percentage = (@current_card).to_f/(@count_cards).to_f * 100.0
  end
end
