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
			set total_time to round ((duration of current track) / 1000) rounding down
			
			set current_time to player position
			
			set total_time_left to total_time - current_time
			
			set minutes_left to 0
			
			if total_time_left > 60 then
				set minutes_left to (round (total_time_left / 60) rounding down)
			end if
			
			set seconds_left to round (total_time_left - (minutes_left * 60))
			
			
			
			return my zeroPadding(minutes_left) & ":" & my zeroPadding(seconds_left)
			
		end if
	end tell
else
	return ""
end if