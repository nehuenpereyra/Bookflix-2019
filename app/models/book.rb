class Book < ApplicationRecord
    has_many :parts
    has_one_attached :url_cover
    validates :expiration_date, presence: true
end
