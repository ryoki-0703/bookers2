Rails.application.routes.draw do
  devise_for :users
  root "homes#top"
  get "home/about" => "homes#about"
  
  resources :books
  resources :users, only: [:show, :edit, :update, :index] do
    resource :relationships, only: [:create, :destroy]
    get :follows, on: :member
    get :followers, on: :member
  end
  get '/search' => 'search#search'

 end