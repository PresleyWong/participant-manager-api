Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do      
      resources :events
      resources :users
      resources :participants do
        collection do
          get :search
        end
      end

      post '/auth/login', to: 'authentication#login'
      post '/add_participant/:event_id/:participant_id', to: 'events#add_participant'
      get '/remove_participant/:event_id/:participant_id', to: 'events#remove_participant'
    end
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  
end
  