Rails.application.routes.draw do
  mount JasmineRails::Engine => '/specs' if defined?(JasmineRails)
  root 'search#index'
  get 'search' => "search#search"
  get 'login' => "users#login"

  resources :users, only: [:create, :show, :update] do
    resources :reviews, only: [:index]
    resources :comments, only: [:index]
  end

  resources :apis, only: [:create, :show, :update], shallow: true do
    resources :reviews, only: [:create, :index] do
      resources :votes, only: [:create, :index]
      resources :comments, only: [:create, :index]
    end
  end

  get 'callback' => 'user#github_callback'
end
