Rails.application.routes.draw do
  # get 'cards/index', to: 'cards#index', as: :cards
  # get 'cards/show', to: 'cards#show', as: :card
  # get 'decks/index', to: 'decks#index', as: :decks
  # get 'decks/show', to: 'decks#show', as: :deck
  # get 'categories/index', to: 'categories#index', as: :categories
  resources :decks do
    resources :cards
  end
  resources :categories, only: [:index]
  devise_for :users
  root to: 'categories#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
