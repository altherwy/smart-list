Rails.application.routes.draw do
  get 'items/add'

  get 'items/update'

  get 'items/delete_all', to: 'items#delete_all'
  
  root to:'items#home'
  
  
  resources :items

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    
end
