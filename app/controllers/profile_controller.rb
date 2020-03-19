class ProfileController < ApplicationController
  def index
    @decks = current_user.decks
    upvoted = current_user.reviews.select{|review| review.review_value == 1}
    @upvoted_decks = upvoted.map{|reviews| reviews.deck}

  end
end
