class Application < ActiveRecord::Base
  belongs_to :freelancer_information
  belongs_to :post

  def status_freelancer(current_user)
  	if self.status.is_a? Integer
  		status = (self.status == current_user.id) ? "Awarded to you" : "Awarded to someone else"
  	else
  		status = self.status
  	end
  	status
  end
  
  def status_poster(user)
  	if self.status.is_a? Integer
  		status = (self.status == user.id) ? "Awarded to this applicant" : "Awarded to a different applicant"
  	else
  		status = self.status
  	end
  	status
  end

  def status
  	awardee = self.post.awarded_to_id
  	status = awardee == nil ? "Not yet awarded" : awardee
  	status 
  end

end
