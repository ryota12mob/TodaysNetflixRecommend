# frozen_string_literal: true

Rails.application.routes.draw do
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'questions#top'
  get 'questions', to: 'questions#questions'
  post 'get_movie', to: 'questions#get_movie'
  get 'result', to: 'questions#result'
  get    '/welcome', to: 'sessions#new',     as: :welcome
  post   '/login',   to: 'sessions#create',  as: :login
  delete '/logout',  to: 'sessions#destroy', as: :logout
  resources :users, only: [:new, :create]
end
