class Tag < ApplicationRecord
    #Atributos: title
    #Relaciones: books

    has_and_belongs_to_many :books

    #Define la validación para las etiquetas
    validates :title, length: { minimum: 5 }
    validates :title, :uniqueness => {:case_sensitive => false}
    validates :title, presence: true, allow_blank: false

    #Define un orden por default para listarlos
    default_scope->{order("title")}
end
