class Subscriber < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         has_many :profiles 

         VALID_EMAIL_REGEX=/\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i    
         
         validates :name, length: {minimum: 4 }
         validates :last_name, uniqueness: true
         validates :email, length: {minimum: 5 }, presence: true, format: {with:VALID_EMAIL_REGEX}
         validates :password, length: {minimum: 6, maximum: 12 }

         validates :card_number, uniqueness: true, length: {minimum: 16, maximum: 16 }
         validates :card_key , presence: true

         validates :expiration_month_date, :inclusion => 1..12
         validates :expiration_year_date, :inclusion => Time.current.year..(Time.current.year+5)
         
         validates :membership_premium, inclusion: { in: [true, false] }
         #validates :current_profiles , presence: true

         #validate :date_validation
         private 
         def date_validation
           self.errors.add(:expiration_date, "no esta en rango."+ Time.zone.parse(self.expiration_date.to_s+'-01').to_s) unless ((Time.now)..(3.years.from_now)).include?(Time.zone.parse(self.expiration_date.to_s+'-01'))
         end

end
