class Profile < ApplicationRecord

    belongs_to :subscriber
    validate :user_must_have_max_profiles_per_subscription , on: :create

    validates :name, length: {minimum: 4, maximum: 12 }
    
    private
    def user_must_have_max_profiles_per_subscription
        if (subscriber.membership_premium && subscriber.profiles.size >= 4)
            return errors.add(:subscriber, " posee un maximo de 4 perfiles")
        elsif (!subscriber.membership_premium && subscriber.profiles.size >= 2)
            return errors.add(:subscriber, " posee un maximo de 2 perfiles")
        end
    end
end
