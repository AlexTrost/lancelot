module FormHelper
  def setup_freelancer_skills(user)
    # ... code from above omitted
    if user.freelancer
    	3.times { user.freelancer_information.skills.build }
  	end
    # 3.times { freelancer_information.rewards.build }
    user
  end
end