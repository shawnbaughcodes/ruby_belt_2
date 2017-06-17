class Song < ActiveRecord::Base
    validates :title, :artist, presence:true
    has_many :users
    has_many :playlists
    has_many :users_added, through: :playlist, source: :user

end
