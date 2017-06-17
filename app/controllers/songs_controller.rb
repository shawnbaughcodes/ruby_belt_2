class SongsController < ApplicationController
  def index
      @current_user = current_user
      @songs = Song.all
      @count = Playlist.where(user: User.all)
      @cc = Song.joins(:playlists)
    #   .where(id: 1).length
  end

  def create
      song = Song.create(song_params)
      if song.valid?
          redirect_to '/songs'
      else
          flash[:song_errors] = song.errors.full_messages
          redirect_to '/'
      end
  end

  def show
      @song = Song.find(params[:id])
      @playlist = Playlist.where(user: User.all, song: params[:id])
      @count = Song.joins(:playlists)
  end

  private
    def song_params
        params.require(:song).permit(:title, :artist)
    end
end
