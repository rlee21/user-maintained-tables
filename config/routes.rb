Rails.application.routes.draw do
  get 'sessions/new'
  root 'static_pages#home'
  get '/about', to: 'static_pages#about'
  resources :users
  get  '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  resources :products do
    collection { post :import }
  end
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
end
