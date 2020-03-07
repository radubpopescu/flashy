class CardAnswersController < ApplicationController
  before_action :destroy_answer, only: [:user_knows, :user_does_not_know]

  def user_knows
    @card_answer = CardAnswer.create(answer: 1, card_id: params[:card_id], user_id: current_user.id)
    @deck = Deck.find(params[:deck_id])
    @card = Card.find(params[:card_id])
    redirect_to deck_card_path(@deck, @card.id + 1)
  end

  def user_does_not_know
    @card_answer = CardAnswer.create(answer: -1, card_id: params[:card_id], user_id: current_user.id)
    @deck = Deck.find(params[:deck_id])
    @card = Card.find(params[:card_id])
    redirect_to deck_card_path(@deck, @card.id + 1)
  end

  private

  def destroy_answer
    if !current_user.card_answers.blank?
      current_user.card_answers.find_by(@card).destroy
    end
  end
end
