class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :poster_information
  has_one :freelancer_information
  has_many :applications, :through => :freelancer_information


  after_create :create_sub_account_objects!

  def create_sub_account_objects!
    FreelancerInformation.create(user_id: self.id)
  	PosterInformation.create(user_id: self.id)
  end

  def information
  	if self.type == "freelancer"
  		self.freelancer_information
  	else
  		self.poster_information
  	end
  end

  def applied(post)
    self.applications.pluck(:post_id).include?(post.id)
  end

  
end
