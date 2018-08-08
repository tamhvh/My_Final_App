class Admin::AlbumsController < ApplicationController
	before_action :get_album, only: [:edit, :update, :destroy]

	def index
		@albums = Album.all
	end

	def show
	end

	def edit
	end

	def update
		if @album.update(album_params)
			redirect_to admin_albums_path
		else
			render 'edit'
		end
	end

	def destroy
		@album.destroy

		redirect_to admin_albums_path
	end

	private
		def album_params
			params.require(:album).permit(:title, :description, :share_mode)
		end

		def get_album
			@album = Album.find(params[:id])
		end
end
