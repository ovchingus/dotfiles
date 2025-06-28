TARGET_DIR=$HOME

### Make config dir if not exist yet
mkdir -p "$TARGET_DIR/.config"

### Stow all configs to $HOME folder
stow -R -d ./shared -t "$TARGET_DIR/.config" .config
stow -R -d ./shared -t "$TARGET_DIR" .
stow -R -d ./arch -t "$TARGET_DIR/.config" .config
stow -R -d ./arch -t "$TARGET_DIR" .

### Bat
# command to build custom themes from ../../bat/themes/ directory
bat cache --build

### Give access to kanata keyboard remapper
# More details https://github.com/jtroo/kanata/wiki/Avoid-using-sudo-on-Linux
if ! id -nGz "$USER" | grep -qzxF "input" || ! id -nGz "$USER" | grep -qzxF "uinput"; then
  echo "Setting up kanata user groups"

  sudo groupadd uinput

  sudo usermod -aG input "$USER"
  sudo usermod -aG uinput "$USER"

  echo 'KERNEL=="uinput", MODE="0660", GROUP="uinput", OPTIONS+="static_node=uinput"' | sudo tee /lib/udev/rules.d/60-kanata-input.rules >/dev/null

  sudo modprobe uinput

  echo "Please logout and login to apply groups configs"
fi
