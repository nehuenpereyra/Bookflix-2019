class Administrator < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :timeoutable

  VALID_EMAIL_REGEX=/\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i    
  validates :email, length: { minimum: 5 }, presence: true, format: {with:VALID_EMAIL_REGEX}
  
  #validates :current_password, length: { minimum: 6, maximum: 12 }
  #validates :password, length: { minimum: 6, maximum: 12 }
  #validates :password_confirmation, length: { minimum: 6, maximum: 12 }

end
