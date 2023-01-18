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
      post '/events/:event_id/register/:participant_id', to: 'appointments#create'      
      delete '/appointments/:id', to: 'appointments#destroy'
      put '/appointments/:id', to: 'appointments#update'
      get '/events/:event_id/participant_appointment/:participant_id', to: 'appointments#participant_appointment'
      delete '/events/:id/remove_attachments', to: 'events#remove_attachments'
    end
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  
end
  