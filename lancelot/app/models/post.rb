class Post < ActiveRecord::Base
  belongs_to :assigned_to, :class_name => "User", :foreign_key => "awarded_to_id"
  belongs_to :poster_information
  has_many :applications
  has_many :contracts

  def award_acknowledged?(user)
  	application = Application.where(post: self, freelancer_information_id: self.awarded_to_id ).first
  	application.acknowledged
  end 

  def action_required?(user)
    is_freelancer = user.freelancer_information.id == self.awarded_to_id
    is_poster = user.poster_information.id == self.poster_information_id
    if !self.contract && is_freelancer
      "Create contract"
    else
      "None"
    end 
  	if self.contract
	  	if (self.contract.awaiting_freelancer_signature && is_freelancer) || (self.contract.awaiting_poster_signature && is_poster)
	  		"Sign contract"
	  	elsif self.contract.awaiting_poster_approval && is_poster
	  		"Approve contract"
	  	elsif self.contract.awaiting_safepayment && is_poster
        "Deposit Payment Protection"
      else
	  		"None"
	  	end
	  else
	  	"None"
	  end
  end

  # def action_required_path(user)
  # 	new_contract_path(post_id: self.id, freelancer_id: user.freelancer_information.id) if !self.contract
  # end

  def contract
  	self.contracts.order('created_at').last
  end

end
