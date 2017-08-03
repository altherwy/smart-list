Rails.application.routes.draw do
  # List Routing
  get 'lists/new'
  post 'lists', to: 'lists#create'
  
  
  # Item Routing
  get 'items/add'
  post 'items', to: 'items#create'
  get 'items/show_single_record'
  get 'items/update'
  get 'items/show_all_records'
  delete '/', to: 'items#destroy'
  delete '/items/show_all_records', to: 'items#destroy'
  patch 'items', to: 'items#patch'

  get 'items/delete_all', to: 'items#delete_all'
  
 
  
  root to:'items#home'
  
  
  #resources :items

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    
end
