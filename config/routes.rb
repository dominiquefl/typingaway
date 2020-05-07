Rails.application.routes.draw do
  get 'welcome/index'
  get '/moon', to: 'application#moon', as: 'moon'
  get '/sun', to: 'application#sun', as: 'sun'
  resources :articles do 
    resources :comments
  end
  resources :tags
  root 'welcome#index'
end
