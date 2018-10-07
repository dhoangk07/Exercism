class Solution < ApplicationRecord
  belongs_to :exercise
  belongs_to :user
  validates_uniqueness_of :user_id, scope: :exercise_id
  enum status: [:locked, :in_progress, :completed]
end
