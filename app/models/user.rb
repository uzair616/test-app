class User < ApplicationRecord
  has_many :articles

  validates :username, presence: true, uniqueness: true, length: { minimum: 3, maximum: 10 }
  EMAIL_RJEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: true,length: { maximum: 105 }, format: { with: EMAIL_RJEX }
end
