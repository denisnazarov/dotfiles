#!/bin/sh

#removes all icons from the dock so it only shows open apps

osascript <<-EOF
tell application "System Events"
  set dockPlistFile to property list file "~/Library/Preferences/com.apple.dock.plist"
    tell dockPlistFile
      tell property list item "persistent-apps"
        set appTileItems to value of (every property list item whose value of property list item "tile-data"'s property list item "file-label" is "NA")
      set its value to appTileItems
    end tell
  end tell
end tell
tell application "Dock" to quit
EOF
