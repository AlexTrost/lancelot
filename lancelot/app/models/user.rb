class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :poster_information
  has_one :freelancer_information
  has_many :applications, :through => :freelancer_information
  has_many :skills, :through => :freelancer_information


  after_create :create_sub_account_objects!

    #   accepts_nested_attributes_for :skills,
    # :allow_destroy => true,
    # :reject_if => proc { |att| 
    #   att[:title].blank?
    # }

  accepts_nested_attributes_for :freelancer_information
  # ,
  #   :allow_destroy => true,
    # :reject_if => proc { |att| 
    #   att[:name].blank? && att[:points].blank? 
    # }
  
  accepts_nested_attributes_for :poster_information
  # ,
  #   :allow_destroy => true,
    # :reject_if => proc { |att| 
    #   att[:name].blank? && att[:points].blank? 
    # }
  
  def title
    self.name ? self.name : self.email
  end

  def number_of_jobs_posted
    self.poster_information.posts.count
  end
  
  def number_of_posted_jobs_awarded
    self.poster_information.posts.where.not(awarded_to_id: nil).count
  end

  def number_of_job_awards_recieved
    Post.all.where(awarded_to_id: self.id).count
  end

  def total_earning
    "tbd . . . "
  end

  def averge_earning_per_job
    "tbd . . . "
  end

  def average_paid_per_job
    "tbd . . . "
  end

  def rating(type)
    "tbd . . . "
  end

  def create_sub_account_objects!
    FreelancerInformation.create(user_id: self.id)
  	PosterInformation.create(user_id: self.id)
  end

  def information
  	if self.freelancer == true
  		self.freelancer_information
  	else
  		self.poster_information
  	end
  end

  def applied(post)
    self.applications.pluck(:post_id).include?(post.id)
  end

  
end
