## nix

My nix config

### How to install

<!-- TODO -->

1. Unlock root access for yabai https://github.com/koekeishiya/yabai/wiki/Disabling-System-Integrity-Protection

### How to apply

Apply for **workstation** profile. Use readlink as my nix config direcroty is managed by stow as symlink.

```
darwin-rebuild switch --flake "$(readlink -f ~/.config/nix-darwin)#workstation"
```

### How to update

First, update packages

```
nix flake update
```

Then apply for **workstation** profile

```
darwin-rebuild switch --flake "$(readlink -f ~/.config/nix-darwin)#workstation"
```
