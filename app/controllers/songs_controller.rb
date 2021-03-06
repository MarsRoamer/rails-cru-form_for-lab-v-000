class SongsController < ApplicationController

	def index
		@songs = Song.all


	end

	def new
		@song = Song.new

	end

	def edit
		@song = Song.find(params[:id])

	end

	def show
		@song = Song.find(params[:id])

	end

	def update
		@song = Song.find(params[:id])
		# @song.update(name: params[:song][:name], artist_id: params[:song][:artist_id], genre_id: params[:song][:genre_id])
		@song.update(params.require(:song).permit(:name, :artist_id, :genre_id))
		redirect_to song_path(@song)

	end

	def create
		
		@song = Song.create(name: params[:song][:name], artist_id: params[:song][:artist_id], genre_id: params[:song][:genre_id])
		redirect_to song_path(@song)

	end

end
