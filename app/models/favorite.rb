class Favorite < ApplicationRecord
    belongs_to :book
    belongs_to :profile

    
end
