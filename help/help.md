# Comandos Utiles

Para instalar las gemas que se incorporan al Gemfile se ejecuta:
bundle install

Generar un controlador llamado "Home" con un metodo "index"
rails generate controller home index
rails g controller books

Generar un modelo
rails g model Book title:string autor:string

rake db:migrate

Cargar datos de prueba permanentes en la base de datos
-> En el archivo /db/seed.rb
Comando para ejecutarlo
rake db:seed

Para subir imagenes y pdf
rails active_storage:install
<%-# <%= image_tag f.pdf.preview(resize_to_limit: [100, 100]) %>-%>

Utiles para cuando hay problemas con migraciones
rake db:drop db:create db:migrate

#Listar las apps
heroku apps
#Crea una app
heroku create
#Setea el repositorio remoto de la app
heroku git:remote -a damp-savannah-92740
#Sube lo que hay en master
git push heroku master
#Ejecuta las migraciones
heroku run rake db:migrate
heroku run rake db:seed

How to reset PG Database on Heroku?
Step 1: heroku restart
Step 2: heroku pg:reset DATABASE (no need to change the DATABASE)
Step 3: heroku run rake db:migrate
Step 4: heroku run rake db:seed (if you have seed)
https://gist.github.com/zulhfreelancer/ea140d8ef9292fa9165e
