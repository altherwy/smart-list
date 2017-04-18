Rails.application.routes.draw do
  get 'items/add'

  get 'items/update'

  get 'items/delete'
  
  root to:'items#home'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    
end
