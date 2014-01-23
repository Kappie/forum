class Topic < ActiveRecord::Base
  belongs_to :board
  belongs_to :user
  has_many :replies
  validates :title, :body, presence: true
end
