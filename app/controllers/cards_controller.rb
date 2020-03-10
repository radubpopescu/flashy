class CardsController < ApplicationController
  def index
    @cards = Card.all
  end

  def show
    # raise
    begin
      @deck = Deck.find(params["deck_id"])
      @card = @deck.cards.find(params["id"])
    rescue ActiveRecord::RecordNotFound
        redirect_to deck_results_path
        return
    end
      @count_card = @deck.cards.last.id - @card.id + 1
      @percentage = (@deck.cards.count - @count_card).to_f/(@deck.cards.count).to_f * 100.0
  end
end
