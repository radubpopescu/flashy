Rails.application.routes.draw do
  # get 'cards/index', to: 'cards#index', as: :cards
  # get 'cards/show', to: 'cards#show', as: :card
  # get 'decks/index', to: 'decks#index', as: :decks
  # get 'decks/show', to: 'decks#show', as: :deck
  # get 'categories/index', to: 'categories#index', as: :categories
  root to: 'decks#index'
  resources :decks, except: :index do
    resources :cards do
      post 'knows', to: 'card_answers#user_knows', as: :user_knows
      post 'does_not_know', to: 'card_answers#user_does_not_know', as: :user_does_not_know
    end
    resources :reviews, only: [:create, :index]
    get 'results', to: 'decks#results', as: :results
    get 'start_playing', to: 'card_answers#start_playing', as: :start_playing
  end
  resources :categories
  resources :favorite_categories, only: [:new, :create]
  devise_for :users
  resources :profile, only: %i[index]
end
