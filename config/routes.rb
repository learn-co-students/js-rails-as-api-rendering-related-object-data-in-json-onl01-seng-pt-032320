Rails.application.routes.draw do
  resources :sightings
  resources :sightings
  get '/birds' => 'birds#index'
end