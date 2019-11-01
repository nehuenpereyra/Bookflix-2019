class Book < ApplicationRecord
    #Atributos: title, description, expirate_date, url_cover, autor
    #Relacines: parts, trailer, genre
    
    has_many :parts
    has_one :trailer
    belongs_to :genre
    
    validates :title, length: { minimum: 5 }
    validates :title, uniqueness: true
    
    validates :autor, length: { minimum: 5 }
    
    validates :editorial, length: { minimum: 5 }

    validates :description , length: { minimum: 10 }

    validates :expiration_date, presence: true

    validates :url_cover, presence: true
    validates :url_cover, length: { minimum: 5 }
end
