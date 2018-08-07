class AlbumsController < ApplicationController
	before_action :authenticate_user!, :only => [:create, :update, :destroy]
	
	def index
		@albums = Album.all
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

		if @album.save
			@photo = @album.photos.create(params[:image])
			redirect_to albums_path
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
