class Exercise < ApplicationRecord
  has_many :solutions
  mount_uploader :avatar, AvatarUploader
  enum difficulty: [:easy, :medium, :hard]
end
