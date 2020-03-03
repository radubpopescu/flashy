class DecksController < ApplicationController
  def index
    @decks = Deck.all
  end

  def show
  end
end
