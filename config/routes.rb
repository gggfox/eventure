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
  delete '/logout', to: 'sessions#destroy'
  post '/attend_event',   to: 'events#attend'
  delete '/unattend_event', to: 'events#unattend'
  get '/42', to: 'users#disp_42'
  post 'events/:id', to: 'comments#create'
  get '/by_category/:q', to: 'events#by_category'
  resources :comments
  resources :users
  resources :events
  resources :categories
end
