class Exercise < ApplicationRecord
  has_many :solutions
  mount_uploader :avatar, AvatarUploader
  enum difficulty: { easy: 1, medium: 2, hard: 3}
end
