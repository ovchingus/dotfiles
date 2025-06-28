# Bat config

Here is my [Bat](https://github.com/sharkdp/bat) config

## How to install themes

Example with `tokyonight_moon`

```sh
mkdir -p "$(bat --config-dir)/themes"
cd "$(bat --config-dir)/themes"
# Replace _moon in the lines below with _day, _night, or _storm if needed.
curl -O https://raw.githubusercontent.com/folke/tokyonight.nvim/main/extras/sublime/tokyonight_moon.tmTheme
bat cache --build
bat --list-themes | grep tokyo # should output "tokyonight_moon"
echo '--theme="tokyonight_moon"' >> "$(bat --config-dir)/config"
```
