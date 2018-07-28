class Photo < ApplicationRecord
	belongs_to :account
	belongs_to :albums, optional: true
end
