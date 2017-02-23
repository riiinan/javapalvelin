class User < ActiveRecord::Base
  belongs_to :article
  has_secure_password
  # :email, :password, :password_confirmation

end
