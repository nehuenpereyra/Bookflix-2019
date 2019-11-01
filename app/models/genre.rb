class Genre < ApplicationRecord

    #Define la validación para los géneros
    validates :title, length: { minimum: 5 }

    #Define un orden por default para listarlos
    default_scope->{order("title")}
    
end
