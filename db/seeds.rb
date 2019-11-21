# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Crear el administrador"
if !Administrator.exists?(email: "admin@admin.com")
    Administrator.create!(email: "admin@admin.com", password: "admin123", privileges:0)
end

puts "Crear los Suscriptores"
if !Subscriber.exists?(email: "jeansoft@hotmail.com")
    Subscriber.create!(email: "jeansoft@hotmail.com", name: "jean", last_name: "soft", password: "jeansoft", card_number: "4536000123456789", expiration_month_date:6,expiration_year_date: 2020 ,card_key: "123",membership_premium:false,current_profiles: 0)
end
if !Subscriber.exists?(email: "admin@admin.com")
    Subscriber.create!(email: "admin@admin.com", name: "admin", last_name: "admin", password: "admin123",  card_number: "6666666666666666", expiration_month_date:6,expiration_year_date: 2020,card_key: "666", membership_premium:true ,current_profiles:0)
end

puts "Cargar los Géneros"
Genre.find_or_create_by(title: "aventura")
Genre.find_or_create_by(title: "fantástico")
Genre.find_or_create_by(title: "suspenso")
Genre.find_or_create_by(title: "comedia")
Genre.find_or_create_by(title: "ciencia ficción")
Genre.find_or_create_by(title: "policíaca")
Genre.find_or_create_by(title: "paranormal")
Genre.find_or_create_by(title: "distópica")
Genre.find_or_create_by(title: "terror")

puts "Cargar las etiquetas"
tag1 = Tag.find_or_create_by(title: "Harry Potter")
tag2 = Tag.find_or_create_by(title: "Los juegos del hambre")
tag3 = Tag.find_or_create_by(title: "Juego de tronos")
tag4 = Tag.find_or_create_by(title: "magia")
tag5 = Tag.find_or_create_by(title: "dragones")
tag6 = Tag.find_or_create_by(title: "edad media")


puts "Cargar los autores"
Author.find_or_create_by(name: "George R. R. Martin")
Author.find_or_create_by(name: "J. R. R. Tolkien")
Author.find_or_create_by(name: "Suzanne Collins")
Author.find_or_create_by(name: "J. K. Rowling")
Author.find_or_create_by(name: "Stephen King")


puts "Cargar las editoriales"
Editorial.find_or_create_by(name: "El ateneo")
Editorial.find_or_create_by(name: "Salamanca")
Editorial.find_or_create_by(name: "Cosmos")

puts "Cargar perfiles"
Profile.find_or_create_by(name: "Toto",url_image:"https://pixel.nymag.com/imgs/daily/vulture/2019/05/14/14-george-rr-martin.w330.h330.jpg",age_restriction:false,subscriber_id:1)


puts "Cargar libros"
book1 = Book.find_or_create_by(title: "Juego de Tronos",
    url_cover:"https://imagessl6.casadellibro.com/a/l/t5/26/9788496208926.jpg",
    description:"Antes de que los Stark viajen al sur, en dirección a Desembarco del Rey (capital de Los Siete Reinos), el hijo de Ned Stark, Bran ve a Cersei Lannister Baratheon, esposa del rey, cometer incesto con su hermano gemelo Jaime Lannister. Este empuja a Bran al vacío desde una torre con la esperanza de ocultar el secreto.",
    expiration_date:"2020-11-14",
    genre_id:2,
    author_id:1,
    editorial_id:1,
    visibility: true
)

if book1.tags.count==0
    book1.tags << [tag3,tag4,tag5,tag6]
end

book2 = Book.find_or_create_by(title: "El Señor de los Anillos",
    url_cover:"https://www.planetadelibros.com/usuaris/libros/fotos/9/m_libros/portada_el-senor-de-los-anillos-i-la-comunidad-del-anillo_j-r-r-tolkien_201505211345.jpg",
    description:"Frodo Bolsón es un hobbit al que su tío Bilbo hace portador del poderoso Anillo Único, capaz de otorgar un poder ilimitado al que la posea, con la finalidad de destruirlo. Sin embargo, fuerzas malignas muy poderosas quieren arrebatárselo.",
    expiration_date:"2020-11-14",
    genre_id:2,
    author_id:2,
    editorial_id:1,
    visibility:true,
)

if book2.tags.count==0
    book2.tags << [tag4,tag6] 
end

book3 = Book.find_or_create_by(title: "Los juegos del hambre",
    url_cover:"http://3.bp.blogspot.com/-bX34Xz9ntPk/UO6ODYoyVvI/AAAAAAAAAVk/15hMfaSKhcA/s1600/T7ej4vW3cV.png",
    description:"En lo que alguna vez fue Norteamérica, la Capital de Panem mantiene sus 12 distritos obligándolos a seleccionar a un niño y a una niña, llamados Tributos, a competir en un evento televisado nacionalmente llamado los Juegos del Hambre. Cada ciudadano debe ver pelear a muerte a los jóvenes. El Tributo del Distrito 12, Katniss Everdeen, solo confía en sus habilidades de caza y buenos instintos en una arena en donde debe sobrevivir contra la humanidad.",
    expiration_date:"2020-11-14",
    genre_id:8,
    author_id:3,
    editorial_id:1,
    visibility:true
)

if book3.tags.count==0
    book3.tags << [tag2] 
end

book4 = Book.find_or_create_by(title: "En llamas",
    url_cover:"https://imagessl9.casadellibro.com/a/l/t5/39/9788427202139.jpg",
    description:"En llamas, es el segundo libro de la trilogía de Los juegos del hambre escrita por la autora estadounidense Suzanne Collins. Salió a la venta en septiembre de 2009 en Estados Unidos y hasta enero de 2010 fue distribuido en español. Continúa la historia de Katniss Everdeen y el país ficticio y futurista de Panem.",
    expiration_date:"2020-11-14",
    genre_id:8,
    author_id:3,
    editorial_id:1,
    visibility:true
)

if book4.tags.count==0
    book4.tags << [tag2] 
end

book5 = Book.find_or_create_by(title: "Harry Potter",
    url_cover:"https://imagessl2.casadellibro.com/a/l/t5/52/9788478884452.jpg",
    description:"El día de su cumpleaños, Harry Potter descubre que es hijo de dos conocidos hechiceros, de los que ha heredado poderes mágicos. Debe asistir a una famosa escuela de magia y hechicería, donde entabla una amistad con dos jóvenes que se convertirán en sus compañeros de aventura. Durante su primer año en Hogwarts, descubre que un malévolo y poderoso mago llamado Voldemort está en busca de una piedra filosofal que alarga la vida de quien la posee.",
    expiration_date:"2020-11-14",
    genre_id:2,
    author_id:4,
    editorial_id:2,
    visibility:true
)

if book5.tags.count==0
    book5.tags << [tag1,tag4] 
end 

Book.find_or_create_by(title: "Cementerio de animales",
    url_cover:"https://http2.mlstatic.com/stephen-king-cementerio-de-animales-libro-digital-D_NQ_NP_836186-MLV28324922350_102018-Q.jpg",
    description:"Un viejo cementerio indio encierra terribles secretos para una inocente familia recién llegada a un pueblo.",
    expiration_date:"2020-11-14",
    genre_id:3,
    author_id:5,
    editorial_id:3,
    visibility:true
)



puts "Cargar las partes"
Part.find_or_create_by(book_id:1,
    url_document:"https://juancrazyheart.files.wordpress.com/2014/12/1-juego-de-tronos.pdf",
    position:0,
    normal_release_date:"2020-11-14",
    premium_release_date:"2020-11-21")

Part.find_or_create_by(book_id:1,
    url_document:"https://juancrazyheart.files.wordpress.com/2014/12/1-juego-de-tronos.pdf",
    position:1,
    normal_release_date:"2020-11-20",
    premium_release_date:"2020-11-25")

Part.find_or_create_by(book_id:1,
    url_document:"https://juancrazyheart.files.wordpress.com/2014/12/1-juego-de-tronos.pdf",
    position:2,
    normal_release_date:"2020-11-25",
    premium_release_date:"2020-11-26")

Part.find_or_create_by(book_id:2,
    url_document:"http://web.seducoahuila.gob.mx/biblioweb/upload/J.R.R.%20Tolkien%20La%20Comunidad%20del%20anillo%20I.pdf",
    position:0,
    normal_release_date:"2020-11-25",
    premium_release_date:"2020-11-26")



puts "Cargar los trailer"
Trailer.find_or_create_by(book_id:1,
    url_document: "https://ujkdsxe.firebaseapp.com/aa491/juego-de-tronos-1-comic-spanish-edition-by-george-rr-martin-8408008811.pdf",
    normal_release_date: "2020-11-30",
    premium_release_date: "2020-11-30")
Trailer.find_or_create_by(book_id:3,
    url_document: "https://grannyswag.files.wordpress.com/2015/06/1-the-hunger-games.pdf",
    normal_release_date: "2020-11-30",
    premium_release_date: "2020-11-30")
