class Day < ApplicationRecord
  belongs_to :recipe

  validates :starts_at, presence: true
end
