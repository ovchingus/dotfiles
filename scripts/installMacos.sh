SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
TARGET_DIR=$HOME

### Make config dir if not exist yet
mkdir -p "$TARGET_DIR/.config"

### Stow all configs to $HOME folder
stow -R -d "$SCRIPT_DIR/shared" -t "$TARGET_DIR/.config" .config
stow -R -d "$SCRIPT_DIR/shared" -t "$TARGET_DIR" .
stow -R -d "$SCRIPT_DIR/macos" -t "$TARGET_DIR/.config" .config
## TODO: Looks like docker constantly owerrides this file even if i delete it and stow
# stow -R -d "$SCRIPT_DIR/macos" -t "$TARGET_DIR/.docker" .docker --adopt
stow -R -d "$SCRIPT_DIR/macos" -t "$TARGET_DIR" .

### Install brew packages with brew bundle
# brew bundle

### Bat
# command to build custom themes from ../../bat/themes/ directory
bat cache --build

### Cursor
# Link cursor settings
ln -sf "$HOME/.config/cursor/User/settings.json" ~/Library/Application\ Support/Cursor/User/settings.json
ln -sf "$HOME/.config/cursor/User/keybindings.json" ~/Library/Application\ Support/Cursor/User/keybindings.json

echo "Applying macOS defaults..."
defaults write -g ApplePressAndHoldEnabled -bool false
# Aerospace https://nikitabobko.github.io/AeroSpace/guide#a-note-on-displays-have-separate-spaces
defaults write com.apple.spaces spans-displays -bool true
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock autohide-delay -float 10000
defaults write com.apple.dock autohide-time-modifier -float 0.1
killall Dock
killall SystemUIServer