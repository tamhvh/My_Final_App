class CreatePhotos < ActiveRecord::Migration[5.2]
  def change
    create_table :photos do |t|
      t.string :title
      t.text :description
      t.boolean :share_mode
      t.references :photoable, polymorphic: true, index: true

      t.timestamps
    end
  end
end
