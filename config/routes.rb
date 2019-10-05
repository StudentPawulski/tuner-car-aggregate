# frozen_string_literal: true

Rails.application.routes.draw do
  get 'provinces/index'
  get 'models/index'
  get 'makes/index'
  get 'listings/index'
  get 'listings/show'

  resources :listings, only: %i[index show]

  root to: 'listings#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
