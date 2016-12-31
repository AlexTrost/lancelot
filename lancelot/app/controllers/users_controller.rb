class UsersController < ApplicationController
	before_filter :authenticate_user!
	# before_filter :update_sanitized_params

	def profile 
		@user = current_user
		render "users/profile/profile"
	end

	def show
		@user = User.find(params[:id])
		render "users/profile/profile"
	end

	def create
		"yo " * 200
	end

	def update
		user = User.find(params[:id])
    user.update_attributes(user_params)
    redirect_to :back
	end

	def dashboard 
		@user = current_user
		render "users/dashboard/dashboard"
	end

	def toggle
		current_user.toggle!(:freelancer)
		redirect_to :back
	end

	def edit
	end 

	def create
	end

	private

	def user_signup_params
     params.permit(:user => [:name, :freelancer, :email, :password, :password_confirmation, :remember_me])

  end

  def user_params
	  # params.require(:user).permit(:name, :freelancer)
    params.require(:user).permit(:name, :attachment, :email, :password, :password_confirmation, :remember_me, poster_information_attributes:[:description, :attachment, :location, :email, :phone, :skype, :website], freelancer_information_attributes: [ :description, :attachment, :location, :email, :phone, :skype, :website, skills_attributes: [:title, :years] ] )
	end

	
	def update_sanitized_params
	  devise_parameter_sanitizer.for(:sign_up) {|u| u.permit(:freelancer, :name)}
	end

end