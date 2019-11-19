class News < ApplicationRecord

    #Define un orden por default para listarlos
    default_scope->{order("created_at")}

    validates :title, length: { minimum: 5 }
    validates :title, uniqueness: true
    
    validates :content , length: { minimum: 15 }


end