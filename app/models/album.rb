class Album < ApplicationRecord
	belongs_to :user
	has_many :photos, as: :photoable
	accepts_nested_attributes_for :photos
end
