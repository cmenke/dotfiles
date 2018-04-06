# Run only if explicitly specified
[[ $RUN_CASK ]] || return 1

# Install native apps
brew tap phinze/homebrew-cask
brew install brew-cask
brew tap caskroom/versions

function installcask() {
    if brew cask info "${@}" | grep "Not installed" > /dev/null; then
        brew cask install "${@}" 2> /dev/null
    else
        echo "${@} is already installed."
    fi
}

# Quicklook Plugins - see https://github.com/sindresorhus/quick-look-plugins
# installcask betterzipql
installcask qlcolorcode
installcask qlprettypatch
installcask quicklook-csv
installcask quicklook-json

# Misc
# installcask adobe-photoshop-cc
# installcask adobe-photoshop-lightroom
installcask google-drive-file-stream
installcask little-snitch
installcask spillo
installcask transmission
installcask vlc
# installcask vox
# installcask vox-preferences-pane

# Development
# installcask dash
installcask iterm2
# installcask kaleidoscope
# installcask paw
# installcask phpstorm
# installcask sequel-pro
installcask sublime-text
installcask tower
installcask transmit
installcask vagrant
installcask visual-studio-code

# Utilities
installcask alfred
installcask hammerspoon
installcask imageoptim
installcask keepingyouawake
installcask the-unarchiver
