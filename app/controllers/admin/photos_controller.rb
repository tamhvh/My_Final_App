class Admin::PhotosController < ApplicationController
	before_action :get_photo, only: [:edit, :update, :destroy]

	def index
		@photos = Photo.all
	end

	def edit
	end

	def update
		if @photo.update(photo_params)
			redirect_to admin_photos_path
		else
			render 'views/photos/edit'
		end
	end

	def destroy
		@photo.destroy

		redirect_to admin_photos_path
	end

	private
		def photo_params
			params.require(:photo).permit(:title, :description, :share_mode, :image)
		end

		def get_album
			@photo = Photo.find(params[:id])
		end
end
