class SongsController < ApplicationController

before_filter :find_playlist
before_filter :find_song, :only => :destroy

def create
	song = @playlist.songs.build(params[:song])
	if song.save
		flash[:notice] = "Song added to playlist."
	else
		flash[:alert] = "There was a problem saving your song."
	end
	redirect_to(playlist_path(@playlist))

end

def destroy
	@song.destroy
	flash[:notice] = "Song removed from playlist."
	redirect_to(playlist_path(@playlist))
end

protected

	def find_playlist
		@playlist = Playlist.find(params[:playlist_id])
	end

	def find_song
		@song = @playlist.songs.find(params[:id])
	end

end
