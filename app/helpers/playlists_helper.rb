module PlaylistsHelper
	def is_user_playlist?(playlist)
		playlist.user == current_user
	end
end
