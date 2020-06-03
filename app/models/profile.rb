class Profile < ApplicationRecord
  belongs_to :user, optional: true
  validates :family_name, :first_name, :family_name_kana, :first_name_kana, :birthday, presence: true
  validates :phone_number, numericality: { only_integer: true }
end
