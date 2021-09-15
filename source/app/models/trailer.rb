class Trailer < ApplicationRecord
    #Atributos: url_document, normal_release_date, premium_release_date
    #Relaciones: book

    belongs_to :book
    
    validates :book_id, uniqueness: true

    validate :pdf_validation

    validates :normal_release_date, presence: true
    validates :premium_release_date, presence: true
    validate :date_validation
    
    private 
    def pdf_validation
        if (url_document.last(4)!='.pdf')
          self.errors[:base] << "No se coloco un enlace a un archivo pdf"
        end
    end
    def date_validation
      self.errors.add(:normal_release_date, "no esta en rango.") unless ((Date.today)..(3.years.from_now)).include?(self.normal_release_date)
      self.errors.add(:premium_release_date, "no esta en rango.") unless ((Date.today)..(3.years.from_now)).include?(self.premium_release_date)
    end
end
