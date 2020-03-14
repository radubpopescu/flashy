class ReviewsController < ApplicationController
  before_action :set_deck, only: [:new, :create, :index]
  before_action :destroy_review, only: [:create]

  def index
    @review = Review.new
    @reviews = @deck.reviews
  end

  def create
    @review = Review.create(content: review_params[:content], review_value: review_params[:review_value].to_i, deck_id: @deck.id, user_id: current_user.id)
    redirect_to deck_path(@deck)
  end

  private

  def review_params
    params.require(:review).permit(:content, :review_value)
  end

  def set_deck
    @deck = Deck.find(params[:deck_id])
  end

  def destroy_review
    if !current_user.reviews.find_by(deck_id: @deck.id).blank?
      current_user.reviews.find_by(deck_id: @deck.id).destroy
    end
  end
end
