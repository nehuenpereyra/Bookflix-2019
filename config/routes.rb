Rails.application.routes.draw do

  #Defino la ruta principal de la página
  root 'home#index'

  devise_for :administrators
  resources :books 
  resources :genres
  resources :tags
  resources :parts
  resources :trailers
  devise_for :subscribers

  get '/preguntas_frecuentes', to: 'informations#pregunta'
  get '/contacto', to: 'informations#contacto'
  get '/condicion', to: 'informations#condicion'
  get '/admin_panel', to: 'informations#admin_panel'

  resources :news

  get 'news/news_home' => 'news#news_home'
  
end
