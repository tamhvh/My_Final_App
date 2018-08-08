class Album < ApplicationRecord
	belongs_to :user
	has_many :photos, as: :photoable, dependent: :destroy
	paginates_per 20
end
