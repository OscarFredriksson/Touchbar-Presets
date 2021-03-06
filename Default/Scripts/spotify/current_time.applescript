on zeroPadding(value as string)
	if (length of value = 1) then
		return "0" & value
	else
		return value
	end if
end zeroPadding


if application "Spotify" is running then
	tell application "Spotify"
		if player position = -1 then
			return "--:--"
		else
			set total_time to player position
			
			set minutes_played to 0
			
			if total_time > 60 then
				set minutes_played to (round (total_time / 60) rounding down)
			end if
			
			set seconds_played to round (total_time - (minutes_played * 60))
			
			
			
			return my zeroPadding(minutes_played) & ":" & my zeroPadding(seconds_played)
			
		end if
	end tell
else
	return ""
end if
