class User < ApplicationRecord
  validates :first_name, :last_name, presence: true

  has_secure_token :api_token
end
