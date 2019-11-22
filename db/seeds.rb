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


puts "Cargar Noticias"
news1 = News.find_or_create_by(
    title: "George R.R. Martin terminará su próximo libro antes de participar en ‘House of the Dragon’",
    content: "El autor de 'Canción de Hielo y Fuego' anunció que terminar su próximo libro es la prioridad antes de involucrarse en la serie 'House of the Dragon'.

    Hace apenas un día que HBO hizo oficial el anuncio de House of the Dragon, la nueva serie de Juego de Tronos que se enfocará en la Casa Targaryen. Ante esto, el autor de Canción de Hielo y Fuego, George R.R. Martin, ofreció algunos detalles del proyecto y anticipó que no escribirá un solo guion hasta terminar con Vientos de Invierno, el próximo libro de la saga.
    
    En una entrada en su blog, Martin especificó que Winds of Winter es su prioridad, y por mucho que quiera escribir episodios de House of the Dragon, no lo hará hasta que el libro no se haya distribuido. Después de esto, el autor espera participar en la próxima serie de HBO de un modo similar a Juego de Tronos.
    
    Martin se abstuvo de dar información específica de la nueva serie, aunque dijo que ha estado en desarrollo por varios años con dos títulos distintos. House of the Dragon es el primer concepto que el autor presentó a HBO en 2016, cuando comenzó a discutirse cuál sería el próximo paso de la popular serie de televisión.
    
    Ryan Condal, que junto a Miguel Sapochnik funge como showrunner, ha escrito una 'cantidad considerable' de la serie. De acuerdo con Martin, Condal es un guionista excelente y gran fanático de Canción de Hielo y Fuego, aunque queda mucho trabajo por hacer.
    "
)

news2 = News.find_or_create_by(title:"Los Juegos del Hambre tendrá nuevo libro en forma de precuela",
    content:"Si algo le debemos a George Lucas (o, al menos, los estudios de Hollywood), es la moda de las precuelas. Pese a lo criticada que fue su decisión de contar al 'antes de' de Star Wars, ayudó a sentar las bases sobre cómo hacer una película de origen, una precuela, y desde entonces muchas sagas han seguido su senda: 'X-Men' y su tetralogía que comenzó con 'Primera Generación'; Harry Potter con sus 'Animales Fantásticos'; 'El señor de los anillos' con 'El hobbit'; Alien con 'Prometheus'... y ahora una más se une a la lista.

    'Los Juegos del Hambre', la saga distópica escrita por Suzanne Collins fue adaptada al cine, lanzando a Jennifer Lawrence al estrellato y convirtiéndose en un auténtico fenómeno fan a principios de los 2010. Pese a que su rendimiento en taquilla bajó en la última entrega (debido a la decisión de dividir el tercer libro en dos partes), el éxito fue brutal, y era lógico que, tarde o temprano, se quisiera seguir estirando el chicle. El universo creado por Collins es muy rico en matices y personajes, y una precuela contándonos como el mundo llegó a plantear los primeros Juegos del Hambre sería muy interesante de ver.
    
    Suzanne Collins ha confirmado que este libro precuela nos contará la historia de los Décimos Juegos del Hambre, 64 años antes de lo que leímos en el primero de los libros, y se lanzará el próximo mayo de 2020. Lionsgate, productora de la tetralogía cinematográfica, ha aprovechado para subirse al carro y confirmar que ya están en conversaciones para una próxima adaptación a la gran pantalla."
)

news3 = News.find_or_create_by(title:"J.K. Rowling ya está escribiendo el guion de ‘Animales Fantásticos 3’",
    content:"En la próximo estación de otoño llega a los cines ‘Animales Fantásticos 2: Los crímenes de Grindelwald‘ y nos llevará de nuevo al mundo mágico creado por J.K. Rowling en la saga de ‘Harry Potter‘. Sin embargo, esta película tiene dos motivos muy especiales para todos los potterheads del universo: regresa Albus Dumbledore, en versión joven y gracias a Jude Law, y volvemos al Colegio Hogwarts de Magia y Hechicería. La secuela, una vez más, está dirigida por David Yates y vuelve a contar con el guion de la propia J.K. Rowling. Después de esta segunda parte, tendremos otros dos años de espera hasta la nueva entrega de una pentalogía de la saga. Así pues, para asegurarse de que la tercera película de la franquicia llegue a tiempo, la escritora ya ha cogido el Hogwarts Express porque está trabajando en el guion de ‘Animales Fantásticos 3‘.

    La autora confirmó sus actuales proyectos, entre los que estaba ‘Animales Fantásticos 3’, de la siguiente manera: «Acabo de terminar la cuarta novela de Galbraith, “Lethal White”, y ahora estoy escribiendo el guion de ‘Animales Fantásticos 3’. Después de eso, escribiré otro libro para niños. He estado dándole vueltas a la historia -que no tiene que ver con ‘Harry Potter’ o el mundo mágico’- durante unos seis años, así que ya es hora de que la escriba en papel».
    
    Demostrando su ética de trabajo, su inmenso talento y su fascinante manejo del tiempo, Rowling confirmó en su página web oficial que acaba de terminar una novela y que está trabajando en el guion de la próxima película de la saga. Ya sabíamos que ‘Animales Fantásticos 3‘ estaba en camino, pero es bueno saber que la creadora de este universo ya está trabajando duramente en la elaboración del tercer capítulo de esta serie protagonizada por Newt Scamander (Eddie Redmayne) y entrelazándose directamente con la mitología establecida por ‘Harry Potter‘."
)

news4 = News.find_or_create_by(title:"Stephen King, encantado con Cementerio de animales: '¡Es adulta, madura y genial!'",
    content:"Cementerio de animales es la última de las muchas adaptaciones de las novelas de Stephen King que llega a la gran pantalla. Una nueva versión de la obra que llega este viernes 5 de abril a los cines y que incluye algunas variaciones importantes respecto a la trama original escrita por el maestro del terror.

    El propio King se ha pronunciado ya sobre estos cambios, y su reacción no ha podido ser más postiva. 'Es una película adulta y madura. ¡Es jodidamente genial!'', afirmó entusiasmado el celebre autor.
    
    ((ATENCIÓN: ESTA NOTICIA CONTIENE SPOILERS))
    
     En una entrevista concedida a Entertainment Weekly, el maestro del terror ha opinado sobre la película que dirigen Kevin Kolsch y Dennis Widmyer: Es algo diferente. Hicieron un buen trabajo.
    
    En esta nueva versión de Cementerio de animales, a diferencia del libro original, y de la película de 1989, quien vuelve a la vida no es el niño pequeño, Gage, sino su hermana mayor, Ellie. Estas modificaciones no han molestado a King, sino todo lo contrario. El escritor no entiene que algunos de sus fans mas puristas no vean con buenos ojos esta variante y se muestra algo experado ante las quejas:
    
     Puedes ir a Tampa por la ruta 301, pero también por la ruta 17. En ambos casos, ¡vas a llegar a Tampa!'', sentencia. El autor de El resplandor o It afirmó que el hecho de que sea la niña y no el niño la que vuelve a la vida 'no cambia nada. Es más, King comprende por qué se hicieron estas modificaciones e incluso las justifica, ya que Ellie puede dar más juego cinematográficamente hablando que el niño pequeño: Quizá es más sencillo trabajar con un zombie cuando es una niña más crecida que con un niño de tres años.
    "
)

news5 = News.find_or_create_by(title:"Todo listo para 'Animales fantásticos 3': Warner confirma fecha, reparto y director de la nueva entrega del universo Harry Potter",
    content:"'Animales fantásticos: Los crímenes de Grindelwald' no funcionó tan bien en taquilla como esperaba Warner, ya que ingresó 161 millones de dólares menos que su predecesora. Sin embargo, esta nueva franquicia dentro del universo Harry Potter sigue dando pingües beneficios y ahora se ha confirmado tanto la fecha como el equipo de la tercera entrega.

    Hace unos días se anunciaba que el rodaje 'Animales fantásticos 3' iba a arrancar a principios de 2020 y ahora Deadline concreta que será en primavera del año que viene cuando las cámaras empiecen a grabar. Sigue habiendo tiempo de sobra para tener lista la película de cara a su estreno el 12 de noviembre de 2020.
    
    La otra jugosa novedad es que el personaje de la Profesora Eulalie “Lally” Hicks, interpretado por Jessica Williams, va a ganar mucha importancia respecto a la segunda entrega. Al igual que con las dos primeras, la acción de la historia se situará en multitud de países a lo largo del planeta, pero la ciudad de Rio de Janeiro en Brasil será la que tenga una mayor importancia.
    
    También llega la confirmación definitiva del regreso de Eddie Redmayne como Newt Scamander, Jude Law como Albus Dumbledore, Johnny Depp como Gellert Grindelwald, Ezra Miller como Credence, Alison Sudol como Queenie Goldstein, Dan Fogler como Jacob Kowalski y Katherine Waterston como Tina Goldstein.
    
    Además, David Yates volverá a ocuparse de la puesta en escena. Yates entró al universo de Harry Potter en 'La orden del Fénix' y desde entonces ha sido el único director del mismo. Por su parte, J.K. Rowling repite en el guion, contando en esta ocasión con la ayuda de Steve Kloves, quien regresa a un universo que parecía haber dejado atrás tras la segunda entrega de 'Las reliquias de la muerte'."
)

news6 = News.find_or_create_by(title:"'El instituto', lo nuevo de Stephen King",
    content:"El libro, sobre chicos secuestrados en una institución para desarrollar sus dones  --con ecos de Ojos de fuego y La zona muerta--, llega en un año increíble para King, desde el estreno de It 2 y Doctor Sueño hasta el proyecto para al fin adaptar The Stand y el regreso de Creepshow. 

    La leyenda de Stephen King (Portland, 1942) como Rey del Terror y refundador del género --al igual que la del Arthur erigiendo Camelot-- empieza muy temprano y de muy joven. Y --como corresponde-- no le faltan rasgos dramáticos: padre que desaparece, madre que se convierte en fuerza de la naturaleza, y el pequeño Stephen evadiéndose por entre las sombras de las ficciones de lo sobrenatural. 'Desde muy niño, siempre quise que me asustaran', recordaría en sus memorias.
    
    Hasta que un buen día se dijo eso de 'Yo podría hacer eso'. Es decir: el asustado comprendió que había llegado el momento de asustar. Y lo hizo haciendo uso de un don con el que pocos cuentan. Y --desde sus primeras páginas-- King ya contó con eso de 'Dejad que los niños se acerquen a mí'. Y los niños se acercaron y siguen acercándose y de ahí que tal vez King sea --junto con Dickens-- el más grande y constante paladín de las criaturas en problemas. King es, sí, el Gran Rey de los Chicos.
    
    'Cuando somos niños pensamos diferente. Pensamos en ángulos en lugar de pensar en línea recta... La más esencial y definitoria característica de la infancia no pasa por la nada esforzada capacidad para fundir los sueños con la realidad sino por la alienación y por el sentirse tan solo. No existen palabras para describir las oscuras exhalaciones y los bruscos giros que emitimos y damos durante la infancia. Un niño inteligente no demora en comprenderlo y no puede sino rendirse y calcular sus inevitables consecuencias. Y un niño que calcula esas consecuencias ya no es un niño', recordará King.
    
    "
)
