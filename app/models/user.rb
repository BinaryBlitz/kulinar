# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string           not null
#  api_token       :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  email           :string
#  password_digest :string
#

class User < ApplicationRecord
  include Authenticable

  has_many :ratings, dependent: :destroy

  validates :name, presence: true
  validates :email, email: true, uniqueness: { case_sensitive: false }

  has_secure_password
  has_secure_token :api_token
end
