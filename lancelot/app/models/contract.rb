class Contract < ActiveRecord::Base
  belongs_to :application
  belongs_to :post

  def awaiting_freelancer_signature
  	self.freelancer_approved == true && self.poster_approved == true && self.freelancer_signed == false
  end

  def awaiting_poster_signature
  	self.freelancer_approved == true && self.poster_approved == true && self.freelancer_signed == false
  end

end

