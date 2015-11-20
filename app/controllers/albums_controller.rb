class AlbumsController < ApplicationController

	def show
		@album = Album.find(params[:id])
	end

	def edit
		@album = Album.find(params[:id])
		@band = Band.new
		@band.name = params[:band_name] if params[:band_name]
		@bands = Band.all
	end

	def update
		@album = Album.find(params[:id])
		if @album
			@album.update(album_params)
			render :show
		else
			render :index
		end
	end

	def destroy
		@album = Album.find(params[:id])
		if @album.destroy
			redirect_to bands_url
		else
			redirect_to bands_url
		end
	end

	def new
		@band = Band.new
		@band.name = params[:band_name] if params[:band_name]

		@album = Album.new
		@bands = Band.all
	end

	def create
		@album = Album.new(album_params)
		if @album.save
			render :show
		else
			@bands = Band.all
			@band = Band.new
			render :new
		end
	end

	private

	def album_params
		params.require(:album).permit(:title, :band_id, :live)
	end

end
