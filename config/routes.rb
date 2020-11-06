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

  get 'buildings/size/:size/location/:location/key/:key', :to => 'buildings#buildingImage'

end
