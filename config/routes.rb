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
      post '/events/:id/register/:participant_id', to: 'events#add_participant'      
      delete '/events/:id/unregister/:participant_id', to: 'events#remove_participant'
      get '/events/:id/participant_appointment/:participant_id', to: 'events#participant_appointment'
    end
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  
end
  