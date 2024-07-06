class User < ApplicationRecord
  has_many :posts, dependent: :destroy

  # Validations can be added here
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  # Add other necessary validations


  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

end
