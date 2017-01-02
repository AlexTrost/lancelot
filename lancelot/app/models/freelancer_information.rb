class FreelancerInformation < ActiveRecord::Base
  belongs_to :user, :class_name => 'User', :foreign_key => 'user_id'
  has_many :skills
  has_many :applications
  mount_uploader :attachment, AttachmentUploader

    accepts_nested_attributes_for :skills,
    :allow_destroy => true,
    :reject_if => proc { |att| 
      att[:title].blank?
    }

  def title
  	self.email ? self.email : self.user.title 
  end
  
end
