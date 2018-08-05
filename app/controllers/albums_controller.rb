class AlbumsController < ApplicationController
	def index
		@albums = Album.all
	end

	def show
		@album = Album.find(params[:id])
	end
	
	def new
		@album = Album.new
	end
	
	def create
		@album = Album.new(phot_params)
		
		if @album.save
			redirect_to albums_path
		else
			render 'new'
		end
	end
	
	def edit
		@album = Album.find(params[:id])
	end
	
	def update
		@album = Album.find(params[:id])

		if @Album.update(photo_params)
			redirect_to albums_path
		else
			render 'edit'
		end
	end
	
	def destroy
		@photo = Album.find(params[:id])
		@photo.destroy

		redirect_to albums_path
	end

	private
		def photo_params
			params.require(:album).permit(:title, :description)
		end
end
