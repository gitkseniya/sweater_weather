Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get '/forecast', to: 'search#show'
      get '/backgrounds', to: 'images#index'
      post '/users', to: 'users#create'
      post '/sessions', to: 'sessions#create'

    end
  end
end
