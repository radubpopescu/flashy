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

  def new
    @deck = Deck.find(params[:deck_id])
    @card = Card.new
  end

  def create
    @card = Card.new(card_params)
    @card.deck_id = params[:deck_id]
    if @card.save
      @created = true
      redirect_to new_deck_card_path(params[:deck_id], saved: "true")
    else
      redirect_to new_deck_card_path(params[:deck_id])
    end
  end

  private

  def card_params
    params.require(:card).permit(:front, :back)
  end
end
