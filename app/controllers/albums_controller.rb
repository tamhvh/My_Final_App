class AlbumsController < ApplicationController
	before_action :authenticate_user!, :only => [:create, :update, :destroy]

	def index
		@albums = Album.all.order("created_at desc").page params[:page]
	end

	def show
		@album = Album.find(params[:id])
	end
	
	def new
		if user_signed_in?
			@album = current_user.albums.new
		else
			@album = Album.new
		end
	end
	
	def create
		@album = current_user.albums.new(album_params)
		photo_array_params = params.require(:album).permit(image: [])
		photo_array = photo_array_params[:image]
		param_hash = Hash.new
		if @album.save
			photo_array.each do |arr|
				param_hash[:image] = arr
				@photo = @album.photos.new(param_hash)
				@photo.title = arr.original_filename
				@photo.description = album_params[:description]
				@photo.share_mode = album_params[:share_mode]
				@photo.save
			end
			redirect_to albums_path, notice: "Create Album Success!"
		else
			render 'new'
		end
	end
	
	def edit
		if user_signed_in?
			@album = current_user.albums.find(params[:id])
		else
			@album = Photo.find(params[:id])
		end
	end
	
	def update
		@album = current_user.albums.find(params[:id])

		if @album.update(album_params)
			redirect_to albums_path
		else
			render 'edit'
		end
	end
	
	def destroy
		@album = current_user.albums.find(params[:id])
		@album.destroy

		redirect_to albums_path
	end

	private
		def album_params
			params.require(:album).permit(:title, :description, :share_mode)
		end
		
end
