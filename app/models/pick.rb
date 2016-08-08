class Pick < ApplicationRecord
  belongs_to :recipe
  belongs_to :selection, inverse_of: :picks
end
