class PlaylistController < ApplicationController
  def index
      
  end

  def create
      Playlist.create(song: Song.find(params[:id]), user: current_user)
      redirect_to '/songs'
  end
end
