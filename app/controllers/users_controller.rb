class UsersController < ApplicationController
	before_action :logged_in?, only: [:new, :create]

	def index
		render :index
	end

	def new
		render :new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			login!(@user)
			redirect_to user_url(@user)
		else
			render :new
		end
	end

	private

	def user_params
    params.require(:user).permit(:email, :password)
  end

end
