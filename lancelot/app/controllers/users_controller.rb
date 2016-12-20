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

	def dashboard 
		@user = current_user
		render "users/dashboard/dashboard"
	end

	def edit
	end 

	def create
	end

	private

	def user_params
     params.permit(:user => [:name, :type, :attachment, :email, :password, :password_confirmation, :remember_me])
  end

  def user_params
	  params.require(:user).permit(:name, :type)
	end

	
	def update_sanitized_params
	  devise_parameter_sanitizer.for(:sign_up) {|u| u.permit(:type, :name)}
	end

end