class SessionsController < ApplicationController
	before_action :logged_in?, only: :destroy

  def new
    render :new
  end

  def create
	  @user = User.find_by_credentials(
	    params[:user][:email],
	    params[:user][:password]
	  )
	  #Switch branches
    if @user.nil?
      #flash incorrect password/username combination
      flash.now[:errors] = ["Invalid login"]
      render :new
    else
      #initiate a new session
      login!(@user)
      redirect_to bands_url
    end
  end

  def destroy
    current_user.reset_session_token!
    session[:session_token] = nil
    redirect_to new_sessions_url
  end
end
