class DecksController < ApplicationController
  def index
    redirect_to categories_path if current_user.favorite_categories.empty?
    @decks = Deck.all
  end

  def show
  end
end
