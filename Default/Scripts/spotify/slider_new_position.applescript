on bttWidgetSliderMoved(sliderValue)
	if application "Spotify" is running then
		tell application "Spotify"
			set duration1 to (get duration of current track)
			set player position to (duration1 / 1000 * sliderValue) - 3
		end tell
	else
		return ""
	end if
end bttWidgetSliderMoved