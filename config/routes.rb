Rails.application.routes.draw do
  
  resources :location_schedules
  resources :requested_subjects
  resources :tutored_subjects
  resources :class_periods
  resources :class_schedules
  resources :online_resources
  resources :locations
  resources :booked_time_slots
  resources :subjects
  resources :tutoring_time_slots
  resources :users, only:[:show, :create] 
  get "/auth", to: "users#show"
  # Routing logic: fallback requests for React Router.
  # Leave this here to help deploy your app later!
  get "*path", to: "fallback#index", constraints: ->(req) { !req.xhr? && req.format.html? }
end
