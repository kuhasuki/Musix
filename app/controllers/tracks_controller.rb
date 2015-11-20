class TracksController < ApplicationController

	def show
	end

	def edit
	end

	def update
	end

	def destroy
		@track = Track.find(params[:id])
		if @track.destroy
			redirect_to bands_url
		else
			redirect_to bands_url
		end
	end

	def new
		@albums = Album.all
		@album = Album.new
		@track = Track.new
		@album.title = params[:album_name] if params[:album_name]
	end

	def create
		@track = Track.new(track_params)
		if @track.save
			redirect_to bands_url
		else
			@albums = Album.all
			@album = Album.new
			@track = Track.new
			@album.title = params[:album_name] if params[:album_name]
			render :new
		end
	end

	private

	def track_params
		params.require(:track).permit(:album_id, :name, :bonus_track, :lyrics)
	end

end
