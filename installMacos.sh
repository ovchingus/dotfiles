TARGET_DIR=$HOME

### Make config dir if not exist yet
mkdir -p "$TARGET_DIR/.config"

### Stow all configs to $HOME folder
stow -R -d ./shared -t "$TARGET_DIR/.config" .config
stow -R -d ./shared -t "$TARGET_DIR" .
stow -R -d ./macos -t "$TARGET_DIR/.config" .config
stow -R -d ./macos -t "$TARGET_DIR" .

### Install brew packages with brew bundle
# brew bundle

### Bat
# command to build custom themes from ../../bat/themes/ directory
bat cache --build

### Cursor
# Link cursor settings
ln -sf "$HOME/.config/cursor/User/settings.json" ~/Library/Application\ Support/Cursor/User/settings.json
ln -sf "$HOME/.config/cursor/User/keybindings.json" ~/Library/Application\ Support/Cursor/User/keybindings.json

### Write mac settings
defaults write com.apple.dock autohide -bool true && killall Dock
defaults write com.apple.dock autohide-delay -float 10000 && killall Dock
defaults write com.apple.dock autohide-time-modifier -float 0.1 && killall Dock
defaults write -g ApplePressAndHoldEnabled -bool false
