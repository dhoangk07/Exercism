class Exercise < ApplicationRecord
  has_many :solutions
  enum difficulty: { easy: 1, medium: 2, hard: 3}
end
