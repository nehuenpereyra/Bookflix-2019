Rails.application.routes.draw do

  #Defino la ruta principal de la página
  root 'home#index'

  devise_for :administrators
  resources :administrators, except: :create
  resources :administrators, controllers: { registrations: 'registrations' }
  resources :books 
  resources :genres
  resources :tags
  resources :parts
  resources :trailers
  devise_for :subscribers
  resources :editorials
  resources :authors
  resources :profiles
  resources :news

  get '/admin_panel', to: 'adminpanel#admin_panel'
  get "/admin_panel/create_admin" => "adminpanel#new_admin"
  post "/admin_panel/create_admin" => "adminpanel#create_admin"
  get "/admin_panel/show_admin" => "adminpanel#show_admin"  
  get "/admin_panel/index_admin" => "adminpanel#index_admin" 
  delete "/admin_panel/index_admin" => "adminpanel#destroy"  


  get '/preguntas_frecuentes', to: 'informations#pregunta'
  get '/contacto', to: 'informations#contacto'
  get '/condicion', to: 'informations#condicion'
  get 'news/news_home' => 'news#news_home'
  
  
end
