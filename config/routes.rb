require 'sidekiq/web'

Rails.application.routes.draw do


  get 'users/index'
  get 'summary', to: 'summary#show'
  get 'job_placement',to:'job_placement#index'
  get 'verification', to:'verification#index'
  get 'register_online', to: 'register_online#index'
  get '/about', to: 'about#index'
  get 'find_jobs', to:'find_jobs#index'
  match '/users',   to: 'users#index',   via: 'get'
  match '/users/:id',     to: 'users#show',       via: 'get'

  resources :users, :only =>[:show]
  resources :jobs
  resources :company_details
  resources :cvs
  resources :charges
  resources :documents
  get'upload_documents/index'
  namespace :admin do
      resources :users
      resources :announcements
      resources :notifications
      resources :services

      root to: "users#index"
    end
  get '/privacy', to: 'home#privacy'
  get '/terms', to: 'home#terms'
  resources :notifications, only: [:index]
  resources :announcements, only: [:index]
  authenticate :user, lambda { |u| u.admin? } do
    mount Sidekiq::Web => '/sidekiq'
  end

  devise_for :users,:path_prefix => 'd'
  root to: 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
