class User < ApplicationRecord
  has_many :blogs
  has_one_attached :image

  before_validation { email.downcase! }
  validates :name, presence: true, length: { maximum: 30 }, uniqueness: true
  validates :email, presence: true, length: { maximum: 255}, uniqueness: true,
            format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validates :password, presence: true, length: { minimum: 6 }

  has_secure_password
end
