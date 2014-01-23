class User < ActiveRecord::Base
  has_many :topics
  has_many :replies
  validates :name, presence: true, uniqueness: true
end
