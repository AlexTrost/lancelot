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
  	if !self.contract
  		"Create contract" 
  	elsif self.contract.awaiting_freelancer_signature
  		"Sign contract"
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
