class UsersController < ApplicationController
	before_action :authenticate_user!

	def show
		@user = User.find(current_user.id)
    	unless @user == current_user
      		redirect_to :back, :alert => "Access denied."
    	end
	end
end
