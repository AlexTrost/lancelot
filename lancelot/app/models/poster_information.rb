class PosterInformation < ActiveRecord::Base
  belongs_to :user, :class_name => 'User', :foreign_key => 'user_id'
  has_many :posts
  mount_uploader :attachment, AttachmentUploader
end
