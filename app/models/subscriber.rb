class Subscriber < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
         validates :password, length: {minimum: 6, maximum: 12 }

         validates :card_number, uniqueness: true, length: {minimum: 16, maximum: 16 }
         validates :card_key, uniqueness: true, length: {minimum: 3, maximum: 3}               

end
