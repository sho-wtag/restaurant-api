class Restaurant < ApplicationRecord
  belongs_to :shift
  has_many :dining_tables
  has_many :reservations

  VALID_PHONE_REGEX = /\A(\d{10}|\(?\d{3}\)?[-. ]\d{3}[-.]\d{4})\z/
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  # Accepted formats for phone - (989) 866-5544 / 999.999.9999 /
  # 9898665544 / 989-866-5544
  validates :phone, presence: true, format: { with: VALID_PHONE_REGEX }
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }
  validates :name, presence: true
end
