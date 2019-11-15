Rails.application.routes.draw do

  devise_for :administrators
  resources :administrators, except: :create
  resources :administrators, controllers: { registrations: 'registrations' }
  resources :books 
  resources :genres
  resources :tags
  resources :parts
  resources :trailers
  devise_for :subscribers

  get "/admin_panel/create_admin" => "adminpanel#new_admin"
  post "/admin_panel/create_admin" => "adminpanel#create_admin"
  get "/admin_panel/show_admin" => "adminpanel#show_admin"  
  get "/admin_panel/index_admin" => "adminpanel#index_admin" 
  delete "/admin_panel/index_admin" => "adminpanel#destroy"  


  #Defino la ruta principal de la página
  root 'home#index'
  get '/preguntas_frecuentes', to: 'informations#pregunta'
  get '/contacto', to: 'informations#contacto'
  get '/condicion', to: 'informations#condicion'
  get '/admin_panel', to: 'adminpanel#admin_panel'

end
