class Reading < ApplicationRecord

    belongs_to :part
    belongs_to :profile

    validates :state, presence: true, allow_blank: false
    validates :state , length: { minimum: 4 }

end
