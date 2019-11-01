class Trailer < ApplicationRecord
    has_one_attached :document
    validates :normal_release_date, presence: true
    validates :premium_release_date, presence: true
end
