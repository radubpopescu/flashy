class CardAnswersController < ApplicationController
  before_action :destroy_answer, only: [:user_knows, :user_does_not_know]

  def user_knows
    @card_answer = CardAnswer.create(answer: 1, card_id: params[:card_id], user_id: current_user.id)
  end

  def user_does_not_know
    @card_answer = CardAnswer.create(answer: -1, card_id: params[:card_id], user_id: current_user.id)
  end

  private

  def destroy_answer
    if !current_user.card_answers.blank?
      current_user.card_answers.find_by(card_id: params[:card_id]).destroy
    end
  end
end
