class CreateAlbums < ActiveRecord::Migration[5.2]
  def change
    create_table :albums do |t|
      t.belongs_to :user, index: true
      t.string :title
      t.text :description
      t.boolean :share_mode

      t.timestamps
    end
  end
end
