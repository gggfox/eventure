# frozen_string_literal: true

Rails.application.routes.draw do
  root 'users#index'
  get 'users/new'

  get '/home', to: 'static_pages#home'
  get '/about', to: 'static_pages#about'
  get '/help', to: 'static_pages#help'
  get '/contact', to: 'static_pages#contact'
  get '/signup',  to: 'users#new'
  resources :users
end
