class UsersController < ApplicationController
  def new
      if current_user
          redirect_to '/songs'
      end
  end

  def create
      user = User.create(user_params)
      if user.valid?
          session[:user_id] = user.id
          redirect_to "/songs"
      else
          flash[:user_errors] = user.errors.full_messages
          redirect_to '/'
      end
  end

  def show
      @current_user = current_user
      @playlists = Playlist.where(user: @current_user)
      @count = Song.joins(:playlists)
  end
  private
    def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
