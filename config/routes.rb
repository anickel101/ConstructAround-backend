Rails.application.routes.draw do
  resources :permits
  resources :buildings
  resources :projects
  resources :comments
  resources :photos
  resources :searches
  resources :user_projects
  resources :users

  get 'buildings/:lat/:long/:range', :to => 'buildings#search'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
