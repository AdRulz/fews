class User < ActiveRecord::Base
  has_secure_password
  before_create :generate_token
  has_many :articles

  protected

  def generate_token
    self.token = loop do
      random_token = SecureRandom.urlsafe_base64(nil, false)
      break random_token unless User.exists?(token: random_token)
    end
  end

end
