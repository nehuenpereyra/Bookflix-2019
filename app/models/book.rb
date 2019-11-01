class Book < ApplicationRecord
    has_many :parts
    validates :autor, length: { minimum: 5 }
    validates :description , presence: true
    validates :expiration_date, presence: true
end
