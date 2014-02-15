###############################################################################
# General UI/UX                                                               #
###############################################################################

# Set computer name (as done via System Preferences → Sharing)
#sudo scutil --set ComputerName "0x6D746873"
#sudo scutil --set HostName "0x6D746873"
#sudo scutil --set LocalHostName "0x6D746873"
#sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName -string "0x6D746873"

# Set standby delay to 24 hours (default is 1 hour)
#sudo pmset -a standbydelay 86400

# Disable the sound effects on boot
sudo nvram SystemAudioVolume=" "

# Reveal IP address, hostname, OS version, etc. when clicking the clock
# in the login window
sudo defaults write /Library/Preferences/com.apple.loginwindow AdminHostInfo HostName

# Disable Notification Center and remove the menu bar icon
launchctl unload -w /System/Library/LaunchAgents/com.apple.notificationcenterui.plist 2> /dev/null

# Stop iTunes from responding to the keyboard media keys
launchctl unload -w /System/Library/LaunchAgents/com.apple.rcd.plist 2> /dev/null


###############################################################################
# SSD-specific tweaks                                                         #
###############################################################################

# Disable hibernation (speeds up entering sleep mode)
sudo pmset -a hibernatemode 0

# Remove the sleep image file to save disk space
sudo rm /Private/var/vm/sleepimage
# Create a zero-byte file instead…
sudo touch /Private/var/vm/sleepimage
# …and make sure it can’t be rewritten
sudo chflags uchg /Private/var/vm/sleepimage

# Disable the sudden motion sensor as it’s not useful for SSDs
#sudo pmset -a sms 0


###############################################################################
# Screen                                                                      #
###############################################################################

# Enable HiDPI display modes (requires restart)
sudo defaults write /Library/Preferences/com.apple.windowserver DisplayResolutionEnabled -bool true


###############################################################################
# Spotlight                                                                   #
###############################################################################

# Only run after first installation
if [ $IS_FRESH ]; then
	# Disable Spotlight indexing for any volume that gets mounted and has not yet
	# been indexed before.
	# Use `sudo mdutil -i off "/Volumes/foo"` to stop indexing any volume.
	#sudo defaults write /.Spotlight-V100/VolumeConfiguration Exclusions -array "/Volumes"

	# Load new settings before rebuilding the index
	killall mds > /dev/null 2>&1

	# Make sure indexing is enabled for the main volume
	sudo mdutil -i on / > /dev/null

	# Rebuild the index from scratch
	sudo mdutil -E / > /dev/null
fi


###############################################################################
# Time Machine                                                                #
###############################################################################

if [ $IS_FRESH ]; then
	# Disable local Time Machine backups
	hash tmutil &> /dev/null && sudo tmutil disablelocal
fi
