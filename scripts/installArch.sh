SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
TARGET_DIR=$HOME

### Make config dir if not exist yet
mkdir -p "$TARGET_DIR/.config"

### Stow all configs to $HOME folder
stow -R -d "$SCRIPT_DIR/shared" -t "$TARGET_DIR/.config" .config
stow -R -d "$SCRIPT_DIR/shared" -t "$TARGET_DIR" .
stow -R -d "$SCRIPT_DIR/arch" -t "$TARGET_DIR/.config" .config
stow -R -d "$SCRIPT_DIR/arch" -t "$TARGET_DIR" .

### Bat
# command to build custom themes from ../../bat/themes/ directory
bat cache --build
