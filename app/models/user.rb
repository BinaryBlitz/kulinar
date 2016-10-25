# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  api_token  :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  name       :string           not null
#

class User < ApplicationRecord
  include Authenticable

  validates :name, presence: true

  has_secure_token :api_token
end
