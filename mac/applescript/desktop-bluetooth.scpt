quit application "System Preferences"

tell application "System Preferences"
	set current pane to pane "Bluetooth"
	activate
end tell

tell application "System Events" to tell process "System Preferences"
	tell window "Bluetooth"
		click button "Advanced…"
		set wakeDevices to checkbox "Allow Bluetooth devices to wake this computer" of sheet 1
		tell wakeDevices to if (1 is equal to its value) then click wakeDevices
		click button "OK" of sheet 1
	end tell
end tell

set bluetoothChanges to "❌ Allow Bluetooth devices to wake this computer"

tell application "System Preferences"
	display dialog bluetoothChanges buttons "Done" with title "🔔 Bluetooth"
end tell

quit application "System Preferences"
