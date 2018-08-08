class FeedsController < ApplicationController

	def index
		#@albums = Album.where(share_mode: true).order("created_at desc")
		@photos = Photo.where(share_mode: true).order("created_at desc")
	end

	def show_type
		
	end


end
