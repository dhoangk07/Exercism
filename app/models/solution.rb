class Solution < ApplicationRecord
  belongs_to :exercise
  enum status: { in_progress: 1, unlocked: 2, completed: 3, locked: 4}
end
