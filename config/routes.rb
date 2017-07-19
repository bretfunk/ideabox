Rails.application.routes.draw do

root to: 'sessions#new'
get '/dashboards'  => 'dashboards#index'

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

# namespace: admin do
#   resources :ideas
# end

end
