# nix

My nix config

## How to install

<!-- TODO -->

1. Unlock root access for yabai <https://github.com/koekeishiya/yabai/wiki/Disabling-System-Integrity-Protection>

## How to apply

Apply for **spb-hq-nb-1355** profile. Use readlink as my nix config direcroty is managed by stow as symlink.

```sh
darwin-rebuild switch --flake "$(readlink -f ~/.config/nix-darwin)#spb-hq-nb-1355"
```

## How to update

First, update packages

```sh
nix flake update
```

Then apply for **spb-hq-nb-1355** profile

```sh
darwin-rebuild switch --flake "$(readlink -f ~/.config/nix-darwin)#spb-hq-nb-1355"
```
