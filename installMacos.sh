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
# bat cache --build

### Cursor
# Link cursor settings
# ln -sf ~/.dotfiles/.config/cursor/settings.json ~/Library/Application\ Support/Cursor/User/settings.json
