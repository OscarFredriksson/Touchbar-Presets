
if application "Spotify" is running then
	
    tell application "Spotify" 
        playpause

        if player state is paused then 
            return "playing"
        else if player state is playing then
            return "paused"
        end if
    end tell
end if

return "paused"