Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get '/forecast', to: 'search#show'
      get '/backgrounds', to: 'images#index'
    end
  end
end
