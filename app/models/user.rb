class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :email, presence: true,  uniqueness: true
  has_many :items
  has_one :profile, dependent: :destroy
  has_one :address, dependent: :destroy
  # has_one :creditcard
end
