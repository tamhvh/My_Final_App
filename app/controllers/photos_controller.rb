class PhotosController < ApplicationController
	before_action :authenticate_user!, :only => [:create, :update, :destroy]
	
	def index
		@photos = Photo.all.order("created_at desc").page params[:page]
	end

	def show
		@photo = Photo.find(params[:id])
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
		@album = Album.find_by_user_id current_user.id
		if @album.nil?
			@photo = current_user.photos.find(params[:id])
		else
			@photo = @album.photos.find(params[:id])
		end
		@photo.destroy

		redirect_to photos_path
	end

	private
		def photo_params
			params.require(:photo).permit(:title, :description, :share_mode, :image)
		end
end
