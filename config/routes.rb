Rails.application.routes.draw do

root to: 'dashboards#index'
get '/dashboards'  => 'dashboards#index'

# resources :users, only: [:new, :create]

get '/login' => 'sessions#new'
post '/login' => 'sessions#create'
delete '/logout' => 'sessions#destroy'

get '/signup' => 'users#new'
post '/users' => 'users#create'

  resources :ideas
# namespace: admin do
#   resources :ideas
# end

end
