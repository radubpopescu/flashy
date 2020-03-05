Rails.application.routes.draw do
  # get 'cards/index', to: 'cards#index', as: :cards
  # get 'cards/show', to: 'cards#show', as: :card
  # get 'decks/index', to: 'decks#index', as: :decks
  # get 'decks/show', to: 'decks#show', as: :deck
  # get 'categories/index', to: 'categories#index', as: :categories
  resources :decks do
    resources :cards
  end
  resources :categories
  resources :favorite_categories, only: [:new, :create]
  devise_for :users
  root to: 'decks#index'

end
