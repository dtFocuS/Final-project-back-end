Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :users, only: [:create, :index, :show]
      post '/login', to: 'auth#create'
      get '/profile', to: 'users#profile'
      resources :activities, only: [:create, :index, :show, :update]
      resources :participations, only: [:create, :index, :show]
      #get '/myParticipations', to: 'participations#my_participations'
      get 'my_joined_activities/:current_user_id', to: 'activities#my_joined_activities'
      get 'others_activities/:current_user_id', to: 'activities#others_activities'
      get 'other_not_joined_activities/:current_user_id', to: 'activities#other_not_joined_activities'
      get 'participants/:activity_id', to: 'users#get_participants'
    end
  end
end
