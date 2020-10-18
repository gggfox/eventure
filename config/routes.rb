# frozen_string_literal: true

Rails.application.routes.draw do
  root 'users#index'
  get 'users/new'
  get 'sessions/new'

  get '/home',      to: 'static_pages#home'
  get '/about',     to: 'static_pages#about'
  get '/help',      to: 'static_pages#help'
  get '/contact',   to: 'static_pages#contact'
  get '/signup',    to: 'users#new'
  get '/login',     to: 'sessions#new'
  post '/login',    to: 'sessions#create'
  get '/logout',    to: 'sessions#destroy'
  delete '/logout', to: 'sessions#destroy'
  resources :users
end
