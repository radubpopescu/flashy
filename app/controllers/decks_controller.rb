class DecksController < ApplicationController
  before_action :set_deck, only: [:show]

  def index
    redirect_to categories_path if current_user.favorite_categories.empty?

    if params[:search]
      @decks = Deck.global_search(params[:search][:name]).sort_by(&:review_total).reverse
    else
      @decks = category_deck.sort_by(&:review_total).reverse
    end
  end

  def new
    @deck = Deck.new()
  end

  def create
    @deck = Deck.new(deck_params)
    @deck.user = current_user
    @deck.save
    redirect_to deck_path(@deck)
  end

  def show
    @review = Review.new
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

  def deck_params
    params.require(:deck).permit(:name, :category_id)
  end

  def category_deck
    decks = []
    current_user.favorite_categories.each do |m|
       decks << Deck.all.select do |n|
        n.category == m.category
      end
    end
    decks.flatten
  end

end
