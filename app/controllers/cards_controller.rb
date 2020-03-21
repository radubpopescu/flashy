class CardsController < ApplicationController
  before_action :set_card, only: [:edit, :update, :destroy]

  def index
    @cards = Card.all
  end

  def show
      @deck = Deck.find(params["deck_id"])
      session[:last_deck].unshift(@deck.id)
      @card = @deck.cards.find(params["id"])
      @count_cards = session[:cards_count]
      @current_card = session[:current_card]
      @percentage = (@current_card).to_f/(@count_cards).to_f * 100.0
  end

  def new
    @deck = Deck.find(params[:deck_id])
    @card = Card.new
  end

  def edit
    @deck = Deck.find(params[:deck_id])
  end

  def update
    @deck = Deck.find(params[:deck_id])
    if @card.update(card_params)
      redirect_to deck_card_path(@deck, @card), notice: 'Card was updated'
    else
      render :edit
    end
  end

  def destroy
    @card.destroy
    redirect_to deck_path(params[:deck_id]), notice: 'Card was deleted'
  end

  def create
    @card = Card.new(card_params)
    @card.deck_id = params[:deck_id]
    if @card.save
      redirect_to new_deck_card_path(params[:deck_id]),notice: 'Card was saved'
    else
      redirect_to new_deck_card_path(params[:deck_id])
    end
  end

  private

  def set_card
    @card = Card.find(params[:id])
  end

  def card_params
    params.require(:card).permit(:front, :back)
  end
end
