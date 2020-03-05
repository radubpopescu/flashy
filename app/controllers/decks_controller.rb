class DecksController < ApplicationController
  before_action :set_deck, only: [:show]

  def index
    redirect_to categories_path if current_user.favorite_categories.empty?

    if params[:search]
      @decks = Deck.global_search(params[:search][:query])
    else
      @decks = Deck.all
    end
  end

  def show
  end


  private

  def set_deck
    @deck = Deck.find(params[:id])
  end
end
