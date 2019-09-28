on openURL(myURL as string)
	tell application "Safari"
        if (count of windows) = 0 then
            make new document
        end if
        
        tell window 1
            set current tab to (make new tab with properties {URL: myURL})
            activate
        end tell
    end tell
end openURL