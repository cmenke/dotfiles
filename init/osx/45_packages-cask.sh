# Don't run this unless it's a fresh system
[ "$IS_FRESH" ] && return 1

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

installcask google-chrome-beta
installcask google-chrome-canary
installcask google-drive
installcask skype
installcask vlc
installcask transmission

installcask f-lux
installcask the-unarchiver
installcask caffeine
installcask keyremap4macbook

installcask iterm2
installcask phpstorm
installcask sublime-text3
installcask sequel-pro
installcask tower
installcask github
installcask transmit
installcask dash
installcask kaleidoscope

installcask virtualbox
installcask vagrant

installcask android-studio
installcask teamviewer
