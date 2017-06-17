class User < ActiveRecord::Base
  has_secure_password
  validates :name, :email, presence:true
  has_many :songs
  has_one :playlist
  has_one :playlist_added, through: :song, source: :playlist
end
