class User < ApplicationRecord
	before_create :create_user_token
	 attr_accessor :remember_token
	 has_secure_password

 def User.new_token
    SecureRandom.urlsafe_base64
  end

  # Remembers a user in the database for use in persistent sessions.
  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, Digest::SHA1.hexdigest(remember_token))
  end	

  def create_user_token
  remember
  end
end
