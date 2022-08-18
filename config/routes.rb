Rails.application.routes.draw do
  root to: "pages#home"
  devise_for :users

  get '/dashboard', to: 'users#dashboard', as: :dashboard

  resources :offers, only: [:index, :show, :new, :create, :destroy] do
    resources :rentals, only: [:create]
  end

  resources :rentals, only: [:update]
  get '/books/search', to: 'books#search', as: :booksearch
end
