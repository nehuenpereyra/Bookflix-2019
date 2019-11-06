class Genre < ApplicationRecord
    #Atributos: title
    #Relaciones: books

    has_many :books
    #Define la validación para los géneros
    validates :title, length: { minimum: 5 }
    validates :title, uniqueness: true

    #Define un orden por default para listarlos
    default_scope->{order("title")}
    
end
