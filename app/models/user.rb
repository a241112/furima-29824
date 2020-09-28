class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name, :last_name, :first_name, :last_name_kana, :first_name_kana, :birthday, presence: true
  validates :password, length: {minimum: 6 }
end
