Rails.application.routes.draw do

  devise_for :administrators
  resources :administrators, except: :create
  resources :books 
  resources :genres
  resources :tags
  resources :parts
  resources :trailers
  devise_for :subscribers

  get "/admin_panel/create_admin" => "adminpanel#new_admin"
  post "/admin_panel/create_admin" => "adminpanel#create_admin"
  #https://stackoverflow.com/questions/24875403/only-allow-admin-user-to-create-new-users-in-rails-with-devise-no-external-modu

  #Defino la ruta principal de la página
  root 'home#index'
  get '/preguntas_frecuentes', to: 'informations#pregunta'
  get '/contacto', to: 'informations#contacto'
  get '/condicion', to: 'informations#condicion'
  get '/admin_panel', to: 'adminpanel#admin_panel'

end
