# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

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

puts "Cargar libros"
Book.find_or_create_by(title: "Juego de Tronos",autor:"George R. R. Martin",
url_cover:"https://imagessl6.casadellibro.com/a/l/t5/26/9788496208926.jpg",
description:"Antes de que los Stark viajen al sur, en dirección a Desembarco del Rey (capital de Los Siete Reinos), el hijo de Ned Stark, Bran ve a Cersei Lannister Baratheon, esposa del rey, cometer incesto con su hermano gemelo Jaime Lannister. Este empuja a Bran al vacío desde una torre con la esperanza de ocultar el secreto.",
expiration_date:"2019-11-14",
editorial: "Normaal",
genre_id:2)
Book.find_or_create_by(title: "El Señor de los Anillos",
    autor:"J. R. R. Tolkien",
    url_cover:"https://www.planetadelibros.com/usuaris/libros/fotos/9/m_libros/portada_el-senor-de-los-anillos-i-la-comunidad-del-anillo_j-r-r-tolkien_201505211345.jpg",
    description:"Frodo Bolsón es un hobbit al que su tío Bilbo hace portador del poderoso Anillo Único, capaz de otorgar un poder ilimitado al que la posea, con la finalidad de destruirlo. Sin embargo, fuerzas malignas muy poderosas quieren arrebatárselo.",
    editorial: "Mediavales Editorial",
    expiration_date:"2019-11-14",
    genre_id:2
)