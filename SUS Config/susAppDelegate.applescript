--
--  susAppDelegate.applescript
--  SUS Config
--
--  Created by Thomas Verschoren on 12/10/13.
--  Copyright (c) 2013 Verschoren. All rights reserved.
--

script susAppDelegate
	property parent : class "NSObject"
	
	property customIP : ""
	
	on buttonCustom:sender
		tell application "System Events"
			set OSVersion to do shell script "sw_vers -productVersion"
		end tell
		set catalogURLValue to "http://" & customIP & ":8088/index.sucatalog"
		do shell script "defaults write /Library/Preferences/com.apple.SoftwareUpdate CatalogURL " & catalogURLValue with administrator privileges
		try
			set catalogURLValue to do shell script "defaults read /Library/Preferences/com.apple.SoftwareUpdate CatalogURL"
		on error errText number errNum
			log {errText, errNum}
			display dialog errText with icon stop
		end try
		display dialog "Je update via de server met IP " & customIP buttons {"OK"}
		quit susAppDelegate
	end buttonCustom:
	
	on buttonNoorderlaan:sender
		tell application "System Events"
			set OSVersion to do shell script "sw_vers -productVersion"
		end tell
		set catalogURLValue to "http://sus.domain.be:8088/index.sucatalog"
		do shell script "defaults write /Library/Preferences/com.apple.SoftwareUpdate CatalogURL " & catalogURLValue with administrator privileges
		try
			set catalogURLValue to do shell script "defaults read /Library/Preferences/com.apple.SoftwareUpdate CatalogURL"
		on error errText number errNum
			log {errText, errNum}
			display dialog errText with icon stop
		end try
		display dialog "Je update via de Switch Noorderlaan Server" buttons {"OK"}
		quit susAppDelegate
	end buttonNoorderlaan:
	
	on buttonGent:sender
		tell application "System Events"
			set OSVersion to do shell script "sw_vers -productVersion"
		end tell
		set catalogURLValue to "http://192.168.1.1:8088/index.sucatalog"
		do shell script "defaults write /Library/Preferences/com.apple.SoftwareUpdate CatalogURL " & catalogURLValue with administrator privileges
		try
			set catalogURLValue to do shell script "defaults read /Library/Preferences/com.apple.SoftwareUpdate CatalogURL"
		on error errText number errNum
			log {errText, errNum}
			display dialog errText with icon stop
		end try
		display dialog "Je update via de Switch Gent Server" buttons {"OK"}
		quit susAppDelegate
	end buttonGent:
	
	on ButtonReset:sender
		do shell script "defaults delete /Library/Preferences/com.apple.SoftwareUpdate CatalogURL" with administrator privileges
		display dialog "Je update worden via Apple gedownload" buttons {"OK"}
		quit susAppDelegate
	end ButtonReset:
	
	on applicationWillFinishLaunching:aNotification
		-- Insert code here to initialize your application before any files are opened 
	end applicationWillFinishLaunching:
	
	on applicationShouldTerminate:sender
		-- Insert code here to do any housekeeping before your application quits 
		return current application's NSTerminateNow
	end applicationShouldTerminate:
	
	on applicationShouldTerminateAfterLastWindowClosed:notif
		return true
	end applicationShouldTerminateAfterLastWindowClosed:
	
end script