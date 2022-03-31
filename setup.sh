#!/bin/bash

# -----------------------------------------------
# START: UTILS
# -----------------------------------------------

title () {
  printf "\n\n\033[0;33m⊚ $1\033[0m\n\n"
}
working () {
  printf "\n\033[0;36m⋇ $1\033[0m\n"
}
question () {
  printf "\n\033[0;35m⊛ $1\033[0m\n"
}
success () {
  printf "\n\033[0;32m◬ $1\033[0m\n\n"
}

# -----------------------------------------------
# END: UTILS
# -----------------------------------------------


# -----------------------------------------------
# START: XCODE CLT
# -----------------------------------------------

title "Xcode CLT"

working "Checking for Xcode CLT..."
if ! xcode-select -p &> /dev/null;
  then
    working "Installing Xcode CLT..."
    xcode-select --install &> /dev/null
    while ! xcode-select -p &> /dev/null;
      do
        sleep 5
    done
    success "Xcode CLT installed"
  else
    success "Xcode CLT found"
fi

# -----------------------------------------------
# END: XCODE CLT
# -----------------------------------------------


# -----------------------------------------------
# START: HOMEBREW
# -----------------------------------------------

title "Homebrew"

working "Checking for Homebrew..."
if test ! $(which brew);
  then
    working "Installing Homebrew..."
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    success "Brews ready!"
  else 
    success "Brews ready!"
fi

working "Grabbing brews..."
# brew bundle
success "Brews Drank!"

# -----------------------------------------------
# END: HOMEBREW
# -----------------------------------------------


# -----------------------------------------------
# START: TOUCH ID SUDO
# -----------------------------------------------

title "Touch ID for sudo"

working "Don't forget to set up Touch ID..."
if ! cat /etc/pam.d/sudo | grep pam_tid > /dev/null;
  then
    sudo sed -i '' '2i\
auth       sufficient     pam_tid.so
' /etc/pam.d/sudo
fi
success "Touch ID for sudo complete!"

# -----------------------------------------------
# END: TOUCH ID SUDO
# -----------------------------------------------


# -----------------------------------------------
# START: macOS
# -----------------------------------------------

title "macOS"

working "Setting macOS preferences..."
sh macos/settings.sh
success "macOS preferences set!"

# -----------------------------------------------
# END: macOS
# -----------------------------------------------


# -----------------------------------------------
# START: SYMLINKS
# -----------------------------------------------

title "Symlinks"

working "Creating symlinks..."
success "Symlink process complete!"


# -----------------------------------------------
# END: SYMLINKS
# -----------------------------------------------

title "SETUP COMPLETE!"
echo
