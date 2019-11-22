class Book < ApplicationRecord
    #Atributos: title, description, expirate_date, url_cover
    #Relacines: parts, trailer, genre, tags, editorial, author
    
    has_many :parts
    has_one :trailer
    belongs_to :genre
    has_and_belongs_to_many :tags
    belongs_to :author
    belongs_to :editorial

    validates :title, length: { minimum: 5 }
    validates :title, uniqueness: true
    
    
    validates :url_cover, length: { minimum: 5 }
    validate :cover_validation
    
    validates :description , length: { minimum: 10 }

    validates :expiration_date, presence: true
    validate :date_validation


    private 
    def cover_validation
        if !(url_cover.last(4)=='.png' || url_cover.last(4)=='.jpg' || url_cover.last(5)=='.jpeg')
          self.errors[:base] << "No se coloco un enlace a la portada que sea png, jpg o jpeg."
        end
    end
    def date_validation
      self.errors.add(:expiration_date, "no esta en rango.") unless ((Time.now)..(3.years.from_now)).include?(self.expiration_date)
    end
    
end

