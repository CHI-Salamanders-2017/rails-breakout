Rails.application.routes.draw do

  resources :users, only: [:new, :create, :show]
  resources :sessions, only: [:new, :create]
  resources :songs

  # resources :categories, only: [:index] do
  #   resources :articles, except: [:destroy]
  # end

  # get '/rounds/:id/next_card', to: 'rounds#next_card', as: "next_card"
  get '/logout', to: 'sessions#destroy'

  root 'songs#index'
end
