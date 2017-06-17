class SessionsController < ApplicationController
  def create
    user = User.find_by(email: login_params[:email])
    if user && user.authenticate(login_params[:password])
        session[:user_id] = user.id
        redirect_to "/songs"
    else
        flash[:login_errors] = 'Invalid shit.'
        redirect_to '/'
    end
  end

  def destroy
      reset_session
      redirect_to '/'
  end

  private
    def login_params
        params.require(:user).permit(:email, :password)
    end

end
