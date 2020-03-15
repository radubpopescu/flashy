class CardAnswersController < ApplicationController
  before_action :destroy_answer, :set_deck
  before_action :set_card, only: [:user_knows, :user_does_not_know]

  def start_playing
    if params[:wrong] == "true"
      session[:current_card] = 0
      session[:cards_count] = @deck.wrong_answers.where(user: current_user).count
      redirect_to deck_card_path(deck_id: @deck, id: @card.nil? ? @deck.wrong_answers.where(user: current_user).first.card_id : @card.next_card(params[:wrong], current_user).id, wrong: params[:wrong])
    else
      session[:current_card] = 0
      session[:cards_count] = @deck.cards.count
      redirect_to deck_card_path(deck_id: @deck, id: @card.nil? ? @deck.cards.first : @card.next_card(params[:wrong], current_user).id, wrong: params[:wrong])
    end
  end

  def user_knows
    session[:current_card] += 1
    @card_answer = CardAnswer.create(answer: 1, card_id: params[:card_id], user_id: current_user.id)
    if @card.next_card(params[:wrong], current_user)
      redirect_to deck_card_path(@deck, @card.next_card(params[:wrong], current_user).id, wrong: params[:wrong])
    else
      redirect_to deck_results_path
    end
  end

  def user_does_not_know
    session[:current_card] += 1
    @card_answer = CardAnswer.create(answer: -1, card_id: params[:card_id], user_id: current_user.id)
    if @card.next_card(params[:wrong], current_user)
      redirect_to deck_card_path(@deck, @card.next_card(params[:wrong], current_user).id, wrong: params[:wrong])
    else
      redirect_to deck_results_path
    end
  end

  private

  def destroy_answer
    @card = current_user.card_answers.find_by(card_id: params[:card_id])
    if @card
      @card.destroy
    end
  end

  def set_deck
    @deck = Deck.find(params[:deck_id])
  end

  def set_card
    @card = Card.find(params[:card_id])
  end
end
