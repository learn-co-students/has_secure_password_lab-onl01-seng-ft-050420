class User < ApplicationRecord
  has_secure_password
  def login(password)
    if self.authenticate(password)
      self.id
    end
  end
end
