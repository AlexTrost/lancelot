class Application < ActiveRecord::Base
  belongs_to :freelancer_information
  belongs_to :post
end
