Rails.application.routes.draw do

  devise_for :users
  #Defino la ruta principal de la página
  root 'home#index'
  get '/pregunta ', to: 'informations#pregunta'
  get '/contacto', to: 'informations#contacto'
  get '/condicion', to: 'informations#condicion'
end
