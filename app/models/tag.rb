class Tag < ApplicationRecord
    #Define la validación para las etiquetas
    validates :title, length: { minimum: 5 }

    #Define un orden por default para listarlos
    default_scope->{order("title")}
end
