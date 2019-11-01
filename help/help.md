# Comandos Utiles

Para instalar las gemas que se incorporan al Gemfile se ejecuta:
bundle install

Generar un controlador llamado "Home" con un metodo "index"
rails generate controller home index
rails g controller books

Generar un modelo
rails g model Book title:string autor:string

Cargar datos de prueba permanentes en la base de datos
-> En el archivo /db/seed.rb
Comando para ejecutarlo
rake db:seed

Para subir imagenes y pdf
rails active_storage:install
<%-# <%= image_tag f.pdf.preview(resize_to_limit: [100, 100]) %>-%>
