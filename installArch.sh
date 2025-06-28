TARGET_DIR=$HOME

mkdir -p "$TARGET_DIR/.config"

### Stow all configs to $HOME folder
stow -R -d ./shared -t "$TARGET_DIR/.config" .config
stow -R -d ./shared -t "$TARGET_DIR" .
stow -R -d ./arch -t "$TARGET_DIR/.config" .config
stow -R -d ./arch -t "$TARGET_DIR" .

### Bat
# command to build custom themes from ../../bat/themes/ directory
# bat cache --build
