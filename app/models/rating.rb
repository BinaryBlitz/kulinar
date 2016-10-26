# == Schema Information
#
# Table name: ratings
#
#  id         :integer          not null, primary key
#  value      :integer
#  recipe_id  :integer
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Rating < ApplicationRecord
  after_save :update_rating
  after_destroy :update_rating

  belongs_to :recipe
  belongs_to :user

  validates :user, uniqueness: { scope: :recipe }
  validates :value, inclusion: { in: [1, -1] }

  scope :liked, -> { where(value: 1) }
  scope :disliked, -> { where(value: -1) }

  private

  def update_rating
    recipe.update(
      likes_count: recipe.ratings.liked.count,
      dislikes_count: recipe.ratings.disliked.count
    )
  end
end
