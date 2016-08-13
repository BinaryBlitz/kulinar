class Tagging < ApplicationRecord
  belongs_to :recipe, inverse_of: :taggings
  belongs_to :tag
end
