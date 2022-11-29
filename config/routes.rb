Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do      

      resources :users do
        member do
          get :appointments
        end
      end

      resources :events do
        member do
          get :participants
        end

        collection do
          get :search
        end
      end

      
      resources :participants do
        member do
          get :events
        end

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
  