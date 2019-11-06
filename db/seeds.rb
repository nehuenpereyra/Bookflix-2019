# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

<<<<<<< HEAD
puts "Cargar los Géneros"
Genre.find_or_create_by(title: "aventuras")
Genre.find_or_create_by(title: "fantástica")
Genre.find_or_create_by(title: "suspenso")
Genre.find_or_create_by(title: "comedia")
Genre.find_or_create_by(title: "ciencia ficción")
Genre.find_or_create_by(title: "policíaca")
Genre.find_or_create_by(title: "paranormal")
Genre.find_or_create_by(title: "distópica")
Genre.find_or_create_by(title: "terror")

puts "Cargar las etiquetas"
Tag.find_or_create_by(title: "Harry Potter")
Tag.find_or_create_by(title: "Los juegos del hambre")


#Carga de una parte
#<ActionController::Parameters {"position"=>"0", "normal_release_date"=>"2019-10-02", "premium_release_date"=>"2019-10-11", "pdf"=>#<ActionDispatch::Http::UploadedFile:0x000000000c4f4b18 @tempfile=#<Tempfile:C:/Users/Nehuen/AppData/Local/Temp/RackMultipart20191031-8500-1qcu204.pdf>, @original_filename="11746_3768_1.pdf", @content_type="application/pdf", @headers="Content-Disposition: form-data; name=\"part[pdf]\"; filename=\"11746_3768_1.pdf\"\r\nContent-Type: application/pdf\r\n">} permitted: false>
=======
puts "Crear los Suscriptores"
if !Subscriber.exists?(email: "jeansoft@hotmail.com")
    Subscriber.create!(email: "jeansoft@hotmail.com", name: "jean", last_name: "soft", password: "jeansoft")
end
>>>>>>> rama_suscriptores
