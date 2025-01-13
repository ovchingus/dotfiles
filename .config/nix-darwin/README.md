## nix

My nix config

### How to apply

Apply for **workstation** profile

```
darwin-rebuild switch --flake ~/.config/nix-darwin#workstation
```

### How to update

First, update packages

```
nix flake update
```

Then apply for **workstation** profile

```
darwin-rebuild switch --flake ~/.config/nix-darwin#workstation
```
