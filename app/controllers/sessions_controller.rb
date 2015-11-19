class SessionsController < ApplicationController
	before_action :logged_in?, except: :destroy

  def new
    render :new
  end

  def create
    @user = User.find_by_credentials(
    params[:user][:email],
    params[:user][:password]
  )
    if @user.nil?
      #flash incorrect password/username combination
      render :new
    else
      #initiate a new session
      login!(@user)
      redirect_to users_url
    end
  end

  def destroy
    if current_user
      current_user.reset_session_token!
      session[:session_token] = nil
      redirect_to new_sessions_url
    end
  end
end
