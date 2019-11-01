class Part < ApplicationRecord
    belongs_to :book
    validates :url_document, length: { minimum: 5 }
    validates :position, presence: true, length:{minimum:0}
    validates :normal_release_date, presence: true
    validates :premium_release_date, presence: true
end
