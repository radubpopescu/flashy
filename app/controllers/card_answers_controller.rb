class CardAnswersController < ApplicationController
  before_action :set_card_answer, only: [:update]
  def create
    @card_answer = CardAnswer.new(card_answer_params)
    @card_answer.save
  end

  def update
    @card_answer.update(card_answer_params)
  end

  private

  def set_card_answer
    @card_answer = current_user.card_answers.find(params[:card_id])
  end

  def card_answer_params
    params.require(:card_answer).permit(:answer, :card_id)
  end
end
