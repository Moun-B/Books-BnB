Rails.application.routes.draw do
  root to: "pages#home"
  devise_for :users

  get '/dashboard', to: 'users#dashboard', as: :dashboard

  resources :offers, only: [:index, :show, :destroy] do
    resources :rentals, only: [:create]
  end

  resources :books, only: [:create] do
    resources :offers, only: [:new, :create]
  end

  resources :rentals, only: [:update]
  get '/books/search', to: 'books#search', as: :booksearch
end
