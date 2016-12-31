class Application < ActiveRecord::Base
  belongs_to :freelancer_information
  belongs_to :post

  def status(current_user)
  	awardee = self.post.awarded_to_id
  	if awardee != nil
  		status = (awardee == current_user.id) ? "Awarded to you" : "Awarded to someone else"
  	else
  		status = "Not yet awarded"
  	end
  	status
  end

end
