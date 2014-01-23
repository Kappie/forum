class User < ActiveRecord::Base
  before_create :create_remember_token

  has_many :topics
  has_many :replies
  validates :name, presence: true, uniqueness: true
  validates :name, format: { with: /\A\w{4,16}\z/ }
  has_secure_password

  def self.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def self.encrypt(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  private

  def create_remember_token
    write_attribute(:remember_token, User.encrypt(User.new_remember_token) )
  end
end
