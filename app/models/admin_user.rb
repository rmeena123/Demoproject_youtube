class AdminUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :posts
  
  devise :database_authenticatable, 
         :recoverable, :rememberable, :validatable

   enum role: [:super_admin, :base_admin]

end
