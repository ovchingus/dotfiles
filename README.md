# dotfiles

This repo contains my dotfile configuration, allowing for a consistent computing experience across multiple machines.
These days I primarily use GNU/Linux via the [Arch Linux distribution](https://archlinux.org).

I manage the various configuration files in this repo using [GNU Stow](https://www.gnu.org/software/stow/). This allows me to set up symlinks for all of my dotfiles using a single command.

## How workspace configuration works

I prefer to use all my configuration files in original state, and copy them to home directory with `stow` command, which creates symlinks.

I use `brew` to manage apps on MacOS. My `Brewfile` configuration includes installation of packages with brew registry.
I use `pacman` and `yay` on arch to manage my apps.

## How to initialize

Required packages:

- git
- stow
- brew (on MacOS)

1. Clone `dotfiles` directory to your user home directory.

   ```sh
   cd ~
   git clone https://github.com/ovchingus/dotfiles.git dotfiles
   ```

2. Use stow to create symlinks in home directory
Run `installMacos.sh` or `installArch.sh` to initialize configurations.

   ```sh
   cd .dotfiles
   chmod +x installMacos.sh
   ./installMacos.sh
   ```

## Arch settings

### Give permissions to kanata

Kanata is a keyboard remapper tool. It needs access to input/uinput to run.

Script to give access placed in `installArch.sh` file.

## MacOS settings

I also changed a few settings in MacOS because the defaults interfere with this config

### make Dock and the native MacOS bar auto-hide  

Desktop & Dock - Autohide Dock can be here somewhere  
Control Center - Enable menu bar autohide here  

Hide Dock via cli:  
`defaults write com.apple.dock autohide -bool true && killall Dock`  

Make it only appear if you float over it with the mouse for 10 seconds (use 4 fingers up gesture to make it appear)  
`defaults write com.apple.dock autohide-delay -float 10000 && killall Dock`

### disable Dock bouncing of apps

`defaults write com.apple.dock no-bouncing -bool TRUE && killall Dock`  

### disable desktop icons

having desktop icons is not very user-friendly together with tiling window managers and, be honest, it is cluttered most of the time anyways so it is recommended to disable them in "Desktop & Dock"  

### disable window animations

Run in terminal:  
`defaults write -g NSAutomaticWindowAnimationsEnabled -bool false`

### reduce motion (for native fullscreen functionality and maybe some more unnecessary animations)

- System Preferences > Accessibility > Display > Reduce motion

### disable lots of MacOS keyboard shortcuts in the MacOS settings

- disable command+Q in MacOS system settings
- be ready to disable a few more, as I am unsure about what other shortcuts might collide

### Move windows by dragging any part of the window (by holding ctrl+cmd)

Run in terminal:  
`defaults write -g NSWindowShouldDragOnGesture -bool true`

### Displays have separate Spaces

Enable this in MacOS settings "Desktop & dock" or else Sketchybar will not start. In general Aerospace recommends disabling this though.  
Read about it here: <https://nikitabobko.github.io/AeroSpace/guide#a-note-on-displays-have-separate-spaces>  

Sketchybar might work with the option being disabled in the future.  
<https://github.com/FelixKratz/SketchyBar/issues/495>
