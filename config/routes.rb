Rails.application.routes.draw do

  resources :books 
  resources :genres
  resources :tags
  resources :parts
  resources :trailers

  devise_for :subscribers
  #Defino la ruta principal de la página
  root 'home#index'
  
end
