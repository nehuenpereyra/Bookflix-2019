class News < ApplicationRecord

    #Define un orden por default para listarlos
    default_scope->{order("created_at")}

    validates :title, length: { minimum: 5 }
    validates :title, :uniqueness => {:case_sensitive => false}
    validates :title, presence: true, allow_blank: false
    
    validates :content , length: { minimum: 15 }
    validates :content, presence: true, allow_blank: false

end