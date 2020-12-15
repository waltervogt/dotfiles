#!/usr/bin/env bash

# Install command-line tools using Homebrew.

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Save Homebrew’s installed location.
BREW_PREFIX=$(brew --prefix)

# Install GNU core utilities (those that come with macOS are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
ln -s "${BREW_PREFIX}/bin/gsha256sum" "${BREW_PREFIX}/bin/sha256sum"

# Install some other useful utilities like `sponge`.
brew install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils
# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed --with-default-names
# Install a modern version of Bash.
brew install bash
brew install bash-completion2

# Switch to using brew-installed bash as default shell
if ! fgrep -q "${BREW_PREFIX}/bin/bash" /etc/shells; then
  echo "${BREW_PREFIX}/bin/bash" | sudo tee -a /etc/shells;
  chsh -s "${BREW_PREFIX}/bin/bash";
fi;

# Install `wget` with IRI support.
brew install wget --with-iri

# Install GnuPG to enable PGP-signing commits.
brew install gnupg

# Install more recent versions of some macOS tools.
brew install vim --with-override-system-vi
brew install grep
brew install openssh
brew install screen
brew install php
brew install gmp

# Install font tools.
#brew tap bramstein/webfonttools
#brew install sfnt2woff
#brew install sfnt2woff-zopfli
#brew install woff2

# Install some CTF tools; see https://github.com/ctfs/write-ups.
# brew install aircrack-ng
# brew install bfg
# brew install binutils
# brew install binwalk
# brew install cifer
# brew install dex2jar
# brew install dns2tcp
# brew install fcrackzip
# brew install foremost
# brew install hashpump
# brew install hydra
# brew install john
# brew install knock
# brew install netpbm
# brew install nmap
# brew install pngcheck
# brew install socat
# brew install sqlmap
# brew install tcpflow
# brew install tcpreplay
# brew install tcptrace
# brew install ucspi-tcp # `tcpserver` etc.
# brew install xpdf
# brew install xz

# Install other useful binaries.
brew install ack
#brew install exiv2
brew install ffmpeg
brew install fortune
# brew install git
# brew install git-lfs
# brew install gs
# brew install imagemagick --with-webp
# brew install lua
# brew install lynx
brew install neovim
brew install node
# brew install p7zip
# brew install pigz
# brew install pv
brew install python
# brew install rename
# brew install rlwrap
# brew install ssh-copy-id
brew install tree
# brew install vbindiff
brew install youtube-dl
# brew install zopfli

# Install Homebrew's Driver Cask
brew tap homebrew/cask-drivers
brew tap homebrew/cask-versions

# Install Casks
cask=(
	drobo-dashboard	
    1password
    1password-cli #https://support.1password.com/command-line-getting-started/
    adobe-creative-cloud
    #alacritty #https://github.com/alacritty/alacritty
    alfred
    #balenaetcher
    banktivity
    bbedit
    #bitbar
    #calibre
    carbon-copy-cloner
    google-chrome
    #day-o
    #dozer
    #dropbox
    #edex-ui
    #fantastical
    firefox
    handbrake
    istat-menus
    iterm2
    #java
    #keka
    keyboard-maestro
    #keycastr
    #lastpass
    #macmediakeyforwarder
    #meteorologist
    microsoft-office
    #minecraft
    #nvalt
    #obs
    #plex-media-player
    #pocket-casts
    #quickbooks
    #qutebrowser
    rectangle
    sequel-pro
    sublime-text
    sublime-merge
    sonos-s1-controller
    spectacle
    #spotify
    #switchresx
    #tor-browser
    #typora
    #virtualbox
    visual-studio-code
    #vlc
) #GUI apps that install with cask

brew install ${cask[@]} --cask #Casks Installer

# Install Mac App Store Applications
brew install mas
brew tap mas-cli/tap
mas=(
    1142578772 #OmniOutliner
    409183694 #Keynote 
    823766827 #OneDrive
    562184107 #LanScan Pro
    682658836 #GarageBand
    425424353 #The Unarchiver
    409789998 #Twitter
    883878097 #Server
    1019272813 #Acorn
    485812721 #TweetDeck
    447521961 #XChat Azure
    1153157709 #Speedtest
    409203825 #Numbers
    497799835 #Xcode
    409201541 #Pages
    1346203938 #OmniFocus
    832917885 #com.craigmullaney.TWiT-tv
    406825478 #Telephone
    408981434 #iMovie
    470158793 #Keka
) #Mac App Store apps I install
mas install ${mas[@]} #Mac App Store Installer

# Remove outdated versions from the cellar.
brew cleanup

mkdir -p ~/.config/youtube-dl
ln -s ~/Projects/dotfiles/.youtube-dl/config ~/.config/youtube-dl/config
