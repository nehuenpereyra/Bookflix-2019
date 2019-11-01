class Part < ApplicationRecord
    belongs_to :book
    has_one_attached :document
    validates :position, presence: true, length:{minimum:0}
    validates :normal_release_date, presence: true
    validates :premium_release_date, presence: true
end
