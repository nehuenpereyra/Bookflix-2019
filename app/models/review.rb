class Review < ApplicationRecord

    belongs_to :book
    belongs_to :profile

    validates :profile_id, uniqueness: { scope: :book }

    validates :text, presence: true, allow_blank: false
    validates :text , length: { minimum: 6 }

    validates :spoiler, inclusion: { in: [true, false] }
end
