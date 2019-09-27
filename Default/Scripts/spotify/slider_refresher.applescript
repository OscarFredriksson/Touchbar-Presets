if application "Spotify" is running then
	tell application "Spotify"
		set position1 to (get player position)
		set duration1 to (get (duration of the current track) / 1000)
	end tell
	set current to position1 / duration1
	return current
else
	return ""
end if