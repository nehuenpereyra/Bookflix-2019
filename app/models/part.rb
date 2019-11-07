class Part < ApplicationRecord
    #Atributos: url_document, position, normal_release_date, premium_release_date
    #Relaciones: book

    belongs_to :book
    
    validates :url_document, length: { minimum: 5 }
    validate :pdf_validation
    
    validates :position, presence: true, length:{ minimum:0 }
    validates :position, uniqueness: { scope: :book }

    validates :normal_release_date, presence: true
    validates :premium_release_date, presence: true
    validate :date_validation

    default_scope->{order("position")}
    private 
    def pdf_validation
        if (url_document.last(4)!='.pdf')
          self.errors[:base] << "No se coloco un enlace a un archivo pdf"
        end
    end
    def date_validation
      self.errors.add(:normal_release_date, "no esta en rango.") unless ((Time.now)..(3.years.from_now)).include?(self.normal_release_date)
      self.errors.add(:premium_release_date, "no esta en rango.") unless ((Time.now)..(3.years.from_now)).include?(self.premium_release_date)
    end
    def part_validation
      if (url_document.last(4)!='.pdf')
        self.errors[:base] << "No se coloco un enlace a un archivo pdf"
      end
  end

end
