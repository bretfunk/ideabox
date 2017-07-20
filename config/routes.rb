Rails.application.routes.draw do

  root to: 'sessions#new'
  get '/learn_more'  => 'dashboards#learn_more'
  get '/support'  => 'dashboards#support'

  # resources :users, only: [:new, :create]

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  get '/signup' => 'users#new'

  resources :users, only: [:show, :new, :create] do
      resources :ideas
    end

  namespace :admin do
    resources :categories, only: [:index]
  end

end
