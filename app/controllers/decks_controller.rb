class DecksController < ApplicationController
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
end
