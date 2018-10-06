class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :solutions
  has_attached_file :avatar,
    :styles   => {
      :medium => "200x200",
      :thumb  => "50x50#",
      :small  => "150x150>"}
  validates_attachment_content_type :avatar, 
           :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
end
