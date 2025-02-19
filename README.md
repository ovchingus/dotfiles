# dotfiles

This repo contains my dotfile configuration, allowing for a consistent computing experience across multiple machines.
These days I primarily use GNU/Linux via the [Arch Linux distribution](https://archlinux.org).

I manage the various configuration files in this repo using [GNU Stow](https://www.gnu.org/software/stow/). This allows me to set up symlinks for all of my dotfiles using a single command:

```sh
stow .
```

## How workspace configuration works

I prefer to use all my configuration files in original state, and copy them to home directory with `stow` command, which creates symlinks.

I use `nix` and `nix-darwin` to manage apps and configuration of my local machine. My `nix-darwin` configuration includes installation of packages with nix and brew registries.

## How to initialize workspace

Required packages:

- git
- stow

1. Clone `dotfiles` directory to your user home directory.

   ```sh
   cd ~
   git clone https://github.com/ovchingus/dotfiles.git .dotfiles
   ```

2. Use stow to create symlinks in home directory

   ```sh
   cd .dotfiles
   stow .
   ```

3. Install `nix`

   Better read [nix documentation](https://github.com/DeterminateSystems/nix-installer?tab=readme-ov-file#install-nix) to get help with installation.

   ```sh
   curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | \
     sh -s -- install
   ```

4. Install `nix-darwin`

   Better follow [nix-darwin documentation](https://github.com/LnL7/nix-darwin?tab=readme-ov-file#getting-started) guide to get help with installation.

   ```sh
   # To use Nixpkgs unstable:
   nix run nix-darwin/master#darwin-rebuild -- switch
   ```

5. Run `nix-darwin` command to apply system settings and install apps

   ```sh
   darwin-rebuild switch --flake "$(readlink -f ~/.config/nix-darwin)#spb-hq-nb-1355"
   ```

## How to update packages

To update packages run update command in directory with flake.nix file:

```sh
cd ~/.dotfiles/.config/nix-darwin
nix flake update
```

Then run darwin rebuild command:

```sh
darwin-rebuild switch --flake "$(readlink -f ~/.config/nix-darwin)#spb-hq-nb-1355"
```

Files installed with brew will update automatically,
because nix-darwin configuration contains following code:

```nix
{
  homebrew.onActivation.upgrade = true;
  homebrew.onActivation.autoUpdate = true;
  homebrew.onActivation.cleanup = "uninstall";
}
```
