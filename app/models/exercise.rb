class Exercise < ApplicationRecord
  has_many :solutions, dependent: :destroy
  has_many :taggings
  has_many :tags, through: :taggings
  # mount_uploader :avatar, AvatarUploader
  enum difficulty: [:easy, :medium, :hard]
  validates :difficulty, presence: true

  scope :by_difficulty, -> (difficulty) { where(difficulty: difficulty) }
  # def self.query_depend_on_difficulty(difficulty)
  #   Exercise.where(difficulty: difficulty)
  # end

  def self.query_depend_on_status(status, user)
    exercise_ids = Solution.where(status: status, user_id: user.id).pluck(:exercise_id)
    self.where(id: exercise_ids)
  end

  def self.query_depend_on_tag(tag)
    tag_ids = Tag.where(name: tag).pluck(:id)
    exercise_ids = Tagging.where(tag_id: tag_ids).pluck(:exercise_id)
    self.where(id: exercise_ids)
  end

  def self.tagged_with(name)
    Tag.find_by!(name: name).exercises
  end

  def self.tag_counts
    Tag.select('tags.*, count(taggings.tag_id) as count').joins(:taggings).group('taggings.tag_id')
  end

  def tag_list
    tags.map(&:name).join(', ')
  end

  def tag_list=(names)
    self.tags = names.split(',').map do |n|
      Tag.where(name: n.strip).first_or_create!
    end
  end
end
