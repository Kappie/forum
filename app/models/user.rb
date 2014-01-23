class User < ActiveRecord::Base
  has_many :topics
  has_many :replies
  validates :name, presence: true, uniqueness: true
  validates :name, format: { with: /\A\w{4,16}\z/ }
  has_secure_password
end
