# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  root 'home#index'
  resources :dashboard
  resources :portfolios do
    resources :holdings
    resources :transactions
  end
end
