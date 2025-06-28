### Install brew packages with brew bundle
brew bundle

### SketchyBar
# https://github.com/FelixKratz/SbarLua?tab=readme-ov-file#lua-module
(git clone https://github.com/FelixKratz/SbarLua.git /tmp/SbarLua && cd /tmp/SbarLua/ && make install && rm -rf /tmp/SbarLua/)

### Bat
# command to build custom themes from ../../bat/themes/ directory
bat cache --build

### Cursor
# Link cursor settings
ln -sf ~/.dotfiles/.config/cursor/settings.json ~/Library/Application\ Support/Cursor/User/settings.json
