Rails.application.routes.draw do

  devise_for :subscribers
  #Defino la ruta principal de la página
  root 'home#index'
  
end
