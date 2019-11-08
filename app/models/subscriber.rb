class Subscriber < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         VALID_EMAIL_REGEX=/\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i    
         
         validates :name, length: {minimum: 4 }
         validates :last_name, uniqueness: true
         validates :email, length: {minimum: 5 }, presence: true, format: {with:VALID_EMAIL_REGEX}
         validates :password, length: {minimum: 6 }, length: {maximum: 12}

         validates :card_number, uniqueness: true
         validates :card_key, length: {minimum: 3}, length: {maximum: 3}
         
         validate :date_validation
         private 
         def date_validation
           self.errors.add(:expiration_date, "no esta en rango.") unless ((Time.now)..(3.years.from_now)).include?(self.expiration_date)
         end

end
