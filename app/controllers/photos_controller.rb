class PhotosController < ApplicationController
	before_action :authenticate_user!, :only => [:create, :update, :destroy]
	
	def index
		@photos = Photo.all
	end

	def show
		if user_signed_in?
			@photo = current_user.photos.find(params[:id])
		else
			@photo = Photo.find(params[:id])
		end
	end
	
	def new
		if user_signed_in?
			@photo = current_user.photos.new
		else
			@photo = Photo.new
		end
	end
	
	def create
		@photo = current_user.photos.new(photo_params)
		
		if @photo.save
			redirect_to photos_path
		else
			render 'new'
		end
	end
	
	def edit
		if user_signed_in?
			@photo = current_user.photos.find(params[:id])
		else
			@photo = Photo.find(params[:id])
		end
	end
	
	def update
		@photo = current_user.photos.find(params[:id])

		if @photo.update(photo_params)
			redirect_to photos_path
		else
			render 'edit'
		end
	end
	
	def destroy
		@photo = current_user.photos.find(params[:id])
		@photo.destroy

		redirect_to photos_path
	end

	private
		def photo_params
			params.require(:photo).permit(:title, :description, :share_mode, :image)
		end
end
