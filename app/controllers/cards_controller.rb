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

  def show_wrong_answers
    begin
      @deck = Deck.find(params["deck_id"])
      @card = @deck.cards.find(params["id"])
      @cards = @deck.wrong_answers
    rescue ActiveRecord::RecordNotFound
        redirect_to deck_results_path
        return
    end
      @count_card = @deck.wrong_answers.last.card_id - @card.id + 1
      @percentage = (@deck.wrong_answers.count - @count_card).to_f/(@deck.wrong_answers.count).to_f * 100.0
  end
end
