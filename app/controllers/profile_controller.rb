class ProfileController < ApplicationController
  def index
    @decks = current_user.decks
    @good_decks = @decks.select{|deck| deck.reviews.where(review_value: 1)}
    @upvotes = @decks.map{|deck| deck.upvotes}
    @reviews = current_user.reviews
    upvoted = current_user.reviews.select{|review| review.review_value == 1}
    @upvoted_decks = upvoted.map{|reviews| reviews.deck}
    @history = session[:last_deck].uniq.map{|deck| Deck.find(deck)}
  end
end
