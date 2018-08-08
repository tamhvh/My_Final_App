class Admin::AlbumsController < ApplicationController
	before_filter :get_album, only: [:show, :edit, :update, :destroy]

	def index
		@albums = Album.all
	end

	def show
		
	end
	
	def new
		
	end

	def create
		
	end

	def edit
		
	end

	def update
		
	end

	def destroy

	end

	private
		def album_params
			params.require(:album).permit(:title, :description, :share_mode)
		end

		def get_album
			@album = Album.find(params[:id])
		end
end
