Rails.application.routes.draw do
  root 'static_pages#home'
  resources :users do
    member { get :giveaway }
  end

  resources :account_activations, only: [:edit]
  resources :products do
    collection { post :import }
  end

  get '/about', to: 'static_pages#about'
  get  '/signup', to: 'users#new'
  post '/signup', to: 'users#create'

  get 'sessions/new'
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
end
