class Album < ApplicationRecord
	belongs_to :account
	has_many :photos
end
