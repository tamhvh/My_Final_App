class Admin::UsersController < ApplicationController
	before_action :get_user, only: [:edit, :update, :destroy]

	def index
		@users = User.all
	end

	def edit
	end

	def update
		if @user.update(user_params)
			redirect_to users_path
		else
			render 'edit'
		end
	end

	def destroy
		@user.destroy

		redirect_to users_path
	end

	private
		def user_params
			params.requier(:user).permit(:firstname, :lastname, :email, :password)
		end

		def get_user
			@user = User.find(params[:id])
		end
end
