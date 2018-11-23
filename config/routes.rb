Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
      resources :users, only: [:create, :index, :update, :destroy]
      post '/login', to: 'auth#create'
      get '/profile', to: 'users#profile'
      get 'restaurants/random', to: 'restaurants#random'
      post 'restaurants/random', to: 'restaurants#random'
      get 'activities/random', to: 'activities#random'
      post 'activities/random', to: 'activities#random'
      resources :restaurants
      resources :activities
      resources :user_restaurants
      resources :user_activities
      resources :friends
    end
  end

end
