class Trailer < ApplicationRecord
    #Atributos: url_document, normal_release_date, premium_release_date
    #Relaciones: book

    belongs_to :book
    validates :book_id, uniqueness: true

    validates :normal_release_date, presence: true
    validates :premium_release_date, presence: true
    
end
