class SongsController < ApplicationController

before_filter :find_playlist

def create
	song = @playlist.songs.build(params[:song])
	if song.save
		flash[:notice] = "Song added to playlist."
	else
		flash[:alert] = "There was a problem saving your song."
	end
	redirect_to(playlist_path(@playlist))
	
end

protected

	def find_playlist
		@playlist = Playlist.find(params[:playlist_id])
	end

end
