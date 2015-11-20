class BandsController < ApplicationController
	before_action :logged_in?

	def index
		@bands = Band.all
		render :index
	end

	def new
		render :new
	end

	def create
		@band = Band.new(band_params)
		if @band.save
			render :show
		else	
			render :new
		end
	end

	def edit
		@band = Band.find(params[:id])
		if @band
			render :edit
		else
			render :index
		end
	end

	def update
		@band = Band.find(params[:id])
		if @band
			@band.update(band_params)
			render :show
		else
			render :index
		end
	end

	def show
		@band = Band.find(params[:id])
		render :show
	end

	def destroy
		@band = Band.find(params[:id])
		if @band.destroy
			redirect_to bands_url
		else
			redirect_to bands_url
		end
	end

	private

	def band_params
		params.require(:band).permit(:name)
	end

end
