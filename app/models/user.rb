class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :works, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_many :friendships
  has_many :friends, through: :friendships
end
