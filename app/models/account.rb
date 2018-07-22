class Account < ApplicationRecord
	validates :first_name, length: {maximum: 25}
	validates :last_name, length: {maximum: 25}
	validates :email, length: {maximum: 255}, uniqueness: true
	validates :password, length: {maximum: 64}

	has_many :photos
	has_many :albums
end
