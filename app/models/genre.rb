class Genre < ApplicationRecord
    #Atributos: title
    #Relaciones: books

    has_many :books, :dependent => :restrict_with_error

    #Define la validación para los géneros
    validates :title, length: { minimum: 5 }
    validates :title, :uniqueness => {:case_sensitive => false}
    validates :title, presence: true, allow_blank: false

    #Define un orden por default para listarlos
    default_scope->{order("title")}
   
end
