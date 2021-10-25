# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'questions#top'
  get 'questions', to: 'questions#questions'
  post 'get_movie', to: 'questions#get_movie'
  get 'result', to: 'questions#result'
end
