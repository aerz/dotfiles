quit application "System Preferences"

set energySaver to "Energy
Saver"

tell application "System Preferences"
	set current pane to pane energySaver
	activate
end tell

tell application "System Events" to tell process "System Preferences"
	tell window "Energy Saver"
		tell group 1
			set preventSleep to checkbox "Prevent computer from sleeping automatically when the display is off"
			set wakeNetwork to checkbox "Wake for network access" of list 1
			set powerNap to checkbox "Enable Power Nap" of list 2

			tell preventSleep to if (0 is equal to its value) then click preventSleep
			tell wakeNetwork to if (1 is equal to its value) then click wakeNetwork
			tell powerNap to if (1 is equal to its value) then click powerNap
		end tell
	end tell
end tell

set titleChanges to "🔔 Energy Saver"

set changesText to "
✅ Prevent computer from sleeping automatically when the display is off
❌ Wake for network access
❌ Enable Power Nap
"

set buttonChanges to "Done"

tell application "System Preferences" to display dialog changesText buttons buttonChanges with title titleChanges

quit application "System Preferences"
