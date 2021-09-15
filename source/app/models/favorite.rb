class Favorite < ApplicationRecord
    belongs_to :book
    belongs_to :profile
    validates :ok, inclusion: { in: [true, false] }
end
