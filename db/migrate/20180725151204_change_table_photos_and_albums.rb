class ChangeTablePhotosAndAlbums < ActiveRecord::Migration[5.2]
  def change
  	add_reference :photos, :accounts, index: true
  	add_reference :albums, :accounts, index: true
  end
end
