class PosterInformation < ActiveRecord::Base
  belongs_to :user, :class_name => 'User', :foreign_key => 'user_id'
  has_many :posts
  mount_uploader :attachment, AttachmentUploader

  def title
  	self.email ? self.email : self.user.title 
  end
end