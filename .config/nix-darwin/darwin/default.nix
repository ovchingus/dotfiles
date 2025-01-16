{ pkgs, ... }:
{
  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages = [
    pkgs.neovim
    pkgs.stow
    pkgs.nodejs_22
    pkgs.iterm2
    pkgs.google-chrome
    pkgs.telegram-desktop
    pkgs.nerd-fonts.fira-code
    pkgs.karabiner-elements
    pkgs.raycast
    pkgs.blueutil
  ];

  nixpkgs.config.allowUnfree = true;

  # Necessary for using flakes on this system.
  nix.settings.experimental-features = "nix-command flakes";

  # Enable alternative shell support in nix-darwin.
  # programs.fish.enable = true;

  # Set Git commit hash for darwin-version.
  # system.configurationRevision = self.rev or self.dirtyRev or null;

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 5;

  programs.zsh.enable = true;
  programs.zsh.enableSyntaxHighlighting = true;

  services.jankyborders.enable = true;
  services.jankyborders.active_color = "0xffe2e2e3";
  services.jankyborders.inactive_color = "0xff414550";
  services.jankyborders.style = "round";
  services.jankyborders.width = 6.0;
  services.jankyborders.hidpi = false;

  services.sketchybar.enable = true;
  system.defaults.NSGlobalDomain._HIHideMenuBar = true;
  services.sketchybar.config = ''
    #!/usr/bin/env bash

    # Define the aerospace plugin logic as a function
    aerospace_plugin() {
      local workspace="$1"
      
      if [ "$workspace" = "$FOCUSED_WORKSPACE"]; then
        sketchybar --set "space.$workspace" background.drawing=on
      else
        sketchybar --set "space.$workspace" background.drawing=off
      fi
    }

    # Add the event for workspace change
    sketchybar --add event aerospace_workspace_change

    # Iterate over all aerospace workspaces
    for sid in $(aerospace list-workspaces --all); do
      sketchybar --add item "space.$sid" left \
        --subscribe "space.$sid" aerospace_workspace_change \
        --set "space.$sid" \
        background.color=0x44ffffff \
        background.corner_radius=5 \
        background.height=20 \
        background.drawing=off \
        label="$sid" \
        click_script="aerospace workspace $sid" \
        script="aerospace_plugin $sid"
    done
  '';


  # Yabai configuration (options required for yabai to work)
  # https://github.com/koekeishiya/yabai?tab=readme-ov-file#requirements-and-caveats
  # services.yabai.enable = true;
  # system.defaults.dock.mru-spaces = false;
  # system.defaults.WindowManager.EnableStandardClickToShowDesktop = false;
  # system.defaults.WindowManager.StandardHideDesktopIcons = false;
  # system.defaults.finder.CreateDesktop = true;
  system.defaults.dock.expose-group-apps = true;
  system.defaults.spaces.spans-displays = true;
  system.defaults.NSGlobalDomain.NSAutomaticWindowAnimationsEnabled = false;
  services.aerospace.enable = true;
  services.aerospace.settings = {
    gaps = {
      inner.horizontal = 10; 
      inner.vertical =   10;
      outer.left =       10;
      outer.bottom =     10;
      outer.top =        10;
      outer.right =      10;
    };
    mode.main.binding = {
      cmd-h = []; # Disable "hide application" systemwide macos shortcut
      cmd-alt-h = []; # Disable "hide others" systemwide macos shortcut

      # See: https://nikitabobko.github.io/AeroSpace/commands#layout
      alt-slash = "layout tiles horizontal vertical";
      alt-comma = "layout accordion horizontal vertical";

      # See: https://nikitabobko.github.io/AeroSpace/commands#focus
      alt-h = "focus left";
      alt-j = "focus down";
      alt-k = "focus up";
      alt-l = "focus right";

      # See: https://nikitabobko.github.io/AeroSpace/commands#move
      alt-shift-h = "move left";
      alt-shift-j = "move down";
      alt-shift-k = "move up";
      alt-shift-l = "move right";

      alt-t = "workspace T"; # Terminal
      alt-b = "workspace B"; # Browser
      alt-g = "workspace G"; # Telegram
      alt-y = "workspace Y"; # Mail / Calendar
      alt-n = "workspace N"; # Notes / Reminders
      # alt-f = "workspace F";
      alt-shift-t = "move-node-to-workspace T"; 
      alt-shift-b = "move-node-to-workspace B";
      alt-shift-g = "move-node-to-workspace G";
      alt-shift-y = "move-node-to-workspace Y";
      alt-shift-n = "move-node-to-workspace N";
      # alt-shift-f = "move-node-to-workspace F";

      alt-shift-f = "fullscreen";
    };
  };
  services.aerospace.settings.on-window-detected = [
    {
      "if" = { app-id  = "com.googlecode.iterm2"; };
      run = [ "move-node-to-workspace T" ];
    } 
  ];
  services.aerospace.settings.exec-on-workspace-change = [
    "/bin/bash"
    "-c"
    "sketchybar --trigger aerospace_workspace_change FOCUSED=$AEROSPACE_FOCUSED_WORKSPACE"
  ];
  # Skhd configuration
  # services.skhd.enable = true;
  # services.skhd.skhdConfig = ''
  #   # App shortcuts
  #   alt - t : open -a "iTerm2"
  #   alt - b : open -a "Google Chrome"
  #
  #   # Yabai shortcuts
  #   alt - h : yabai -m window --focus west
  #   alt - j : yabai -m window --focus south
  #   alt - k : yabai -m window --focus north
  #   alt - l : yabai -m window --focus east
  #   alt - f : yabai -m window --toggle zoom-fullscreen
  #   alt - g : yabai -m window --toggle windowed-fullscreen
  #   alt - v : yabai -m window --toggle split
  # '';

  # Global settings
  system.defaults.NSGlobalDomain.ApplePressAndHoldEnabled = false;
  system.defaults.NSGlobalDomain.AppleShowAllExtensions = true;
  system.defaults.NSGlobalDomain.AppleShowAllFiles = true;
  system.defaults.NSGlobalDomain.InitialKeyRepeat = 25;
  system.defaults.NSGlobalDomain.KeyRepeat = 2;
  system.defaults.finder.AppleShowAllExtensions = true;
  system.defaults.finder.AppleShowAllFiles = true;
  system.defaults.finder.FXPreferredViewStyle = "clmv";
  system.defaults.dock.autohide = true;
  system.defaults.dock.orientation = "left";
  system.defaults.dock.persistent-apps = [
    "/System/Applications/Mail.app"
    "/System/Applications/Calendar.app"
    "/System/Applications/Reminders.app"
    "/System/Applications/Notes.app"
    "/System/Applications/Music.app/"
    "${pkgs.google-chrome}/Applications/Google Chrome.app"
    "${pkgs.telegram-desktop}/Applications/Telegram.app"
    "${pkgs.iterm2}/Applications/iTerm2.app"
  ];
}

