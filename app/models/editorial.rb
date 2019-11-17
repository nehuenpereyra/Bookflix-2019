class Editorial < ApplicationRecord
    #Atributos: name
    #Relaciones: books

    has_many :books, :dependent => :restrict_with_error

    #Define la validación para los géneros
    validates :name, length: { minimum: 5 }
    validates :name, uniqueness: true

    #Define un orden por default para listarlos
    default_scope->{order("name")}
end
