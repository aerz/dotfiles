on openNotificationCentre()
	tell application "System Events" to tell process "SystemUIServer"
		tell menu bar item "Notification Centre" of menu bar 1
			perform action "AXPress"
		end tell
	end tell
end openNotificationCentre

on pressButton(textoooo)
	-- Press on Edit button
	tell application "System Events" to tell process "Notification Centre"
		tell window "Notification Centre"
			tell button textoooo to perform action "AXPress"
		end tell
	end tell
end pressButton

on removeWidgets()
	tell application "System Events" to tell process "Notification Centre"
		tell window "Notification Centre"
			repeat until not (exists button 1 of scroll area 1)
				tell button 1 of scroll area 1 to perform action "AXPress"
			end repeat

			delay 2 -- wait for animations
		end tell
	end tell
end removeWidgets

on addWidget(widgetText)
	tell application "System Events" to tell process "Notification Centre"
		tell window "Notification Centre"
			tell scroll area 2
				set counter to 0

				repeat with widget in every static text
					if (value of static text counter is widgetText) then
						tell button counter to perform action "AXPress"
					end if
					set counter to counter + 1
				end repeat
			end tell
		end tell
	end tell

	delay 2 -- wait for animations again
end addWidget

openNotificationCentre()
pressButton("Edit")
removeWidgets()
addWidget("MINIPLAY")
addWidget("WEATHER")
pressButton("Done")
