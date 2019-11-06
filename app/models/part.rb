class Part < ApplicationRecord
    #Atributos: url_document, position, normal_release_date, premium_release_date
    #Relaciones: book

    belongs_to :book
    
    validates :url_document, length: { minimum: 5 }
    
    validates :position, presence: true, length:{ minimum:0 }
    
    validates :normal_release_date, presence: true
    validates :premium_release_date, presence: true

    default_scope->{order("position")}
end
