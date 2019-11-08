Rails.application.routes.draw do

  devise_for :administrators
  resources :books 
  resources :genres
  resources :tags
  resources :parts
  resources :trailers
  devise_for :subscribers

  #Defino la ruta principal de la página
  root 'home#index'
  get '/preguntas_frecuentes', to: 'informations#pregunta'
  get '/contacto', to: 'informations#contacto'
  get '/condicion', to: 'informations#condicion'
  get '/admin_panel', to: 'informations#admin_panel'
end
