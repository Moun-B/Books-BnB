Rails.application.routes.draw do
  root to: "pages#home"

  devise_for :users, only: [:show] do
    resources :rentals, only: [:new, :create, :edit, :update]
  end

  resources :books, only: [:show, :new, :create, :edit, :update] do
    resources :reviews, only: [:new, :create, :edit, :update]
  end

  resources :books, only: [:destroy]
  resources :rentals, only: [:destroy]
  resources :reviews, only: [:destroy]
end
