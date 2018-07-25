class Account < ApplicationRecord
	validates :first_name, length: {maximum: 25}, allow_blank: false
	validates :last_name, length: {maximum: 25}, allow_blank: false
	validates :email, length: {maximum: 255}, allow_blank: false
	validates :password, length: {in: 8..64}, allow_blank: false

	has_many :photos
	has_many :albums
end
