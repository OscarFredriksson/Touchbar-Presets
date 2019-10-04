tell application "System Events"
    tell dock preferences to set autohide to 1
end tell

delay 0.01

tell application "BetterTouchTool"

    trigger_action "{\"BTTPredefinedActionType\":21}"

end tell