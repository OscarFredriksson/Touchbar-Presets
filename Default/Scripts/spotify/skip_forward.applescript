if application "Spotify" is running then
	tell application "Spotify"
		set curr_position to (get player position)
		set player position to (curr_position + 15)
	end tell
else
	return ""
end if