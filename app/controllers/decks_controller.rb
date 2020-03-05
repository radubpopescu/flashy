class DecksController < ApplicationController
  before_action :set_deck, only: [:show]

  def index
    # raise
    redirect_to categories_path if current_user.favorite_categories.empty?
    # response.headers['Set-Cookie'] = 'Secure;SameSite=None'

    if params[:search]
      @decks = Deck.deck_search(params[:search][:query])
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
