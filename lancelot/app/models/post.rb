class Post < ActiveRecord::Base
  belongs_to :assigned_to, :class_name => "User", :foreign_key => "awarded_to_id"
  belongs_to :poster_information


end
