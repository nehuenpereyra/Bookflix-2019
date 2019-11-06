Rails.application.routes.draw do

<<<<<<< HEAD
  resources :books 
  resources :genres
  resources :tags
  resources :parts
  resources :trailers

=======
  devise_for :subscribers
>>>>>>> rama_suscriptores
  #Defino la ruta principal de la página
  root 'home#index'
  
end
