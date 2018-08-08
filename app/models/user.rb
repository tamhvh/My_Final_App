class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, password_length: 8..64
         #:confirmable

  validates :firstname, presence: true, length: {maximum: 25}, allow_blank: false
  validates :lasttname, presence: true, length: {maximum: 25}, allow_blank: false

  has_many :albums
  has_many :photos, as: :photoable

  has_attached_file :avatar, styles: { medium: "100x100>", thumb: "50x50>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
  
end
