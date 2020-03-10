class DecksController < ApplicationController
  before_action :set_deck, only: [:show]

  def index
    # raise
    redirect_to categories_path if current_user.favorite_categories.empty?

    if params[:search]
      @decks = Deck.global_search(params[:search][:name]).sort_by(&:review_total).reverse
    else
      @decks = Deck.all.sort_by(&:review_total).reverse
    end
  end

  def show
    @reviews = @deck.reviews
  end

  def results
    @deck = Deck.find(params[:deck_id])
    @results_positive = 0
    @results_negative = 0
    @deck.card_answers.each do |card_answer|
      card_answer[:answer].to_i == 1 ? @results_positive += 1 : @results_negative += 1
    end
  end

  private

  def set_deck
    @deck = Deck.find(params[:id])
  end
end
