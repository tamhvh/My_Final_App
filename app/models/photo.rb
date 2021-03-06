class Photo < ApplicationRecord
	belongs_to :photoable, polymorphic: true
	has_attached_file  :image, styles: { medium: "200x200#"}, default_url: "/images/:style/missing.png"
	validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
	paginates_per 20
end
