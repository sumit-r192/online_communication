# frozen_string_literal: true

Rails.application.routes.draw do
  root 'home#index'

  resources :projects do
    resources :teams, only: %i[index new create]
  end

  resources :teams, only: %i[show edit update destroy] do
    resources :developers, only: %i[index create destroy]
  end
end
