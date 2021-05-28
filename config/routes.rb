Rails.application.routes.draw do
  get 'welcome/index'
  get '/moon', to: 'application#moon', as: 'moon'
  get '/sun', to: 'application#sun', as: 'sun'
  resources :articles do
    resources :comments
  end
  resources :tags
  resources :authors
  resources :author_sessions, only: [:new, :create, :destroy]
  get 'login' => 'author_sessions#new'
  get 'logout' => 'author_sessions#destroy'
  root 'welcome#index'
end
