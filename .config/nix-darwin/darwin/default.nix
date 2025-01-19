{ pkgs, ... }:
{
  # Homebrew configuration is temporal
  # until nix repo is updating
  homebrew.enable = true;
  homebrew.onActivation.upgrade = true;
  homebrew.onActivation.autoUpdate = true;
  homebrew.onActivation.cleanup = "uninstall";
  homebrew.taps = [ ];
  homebrew.brews = [ ];
  homebrew.casks = [
    "ghostty"
    "openscad"
    "karabiner-elements"

    # fonts
    "sf-symbols"
    "font-sf-pro"
    "font-sf-mono"
  ];
  
  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages = [
    pkgs.neovim
    pkgs.stow
    pkgs.google-chrome
    pkgs.telegram-desktop
    pkgs.raycast
    pkgs.blueutil
    pkgs.starship

    # languages
    pkgs.python312Full
    pkgs.nodejs_22

    # cli tools
    pkgs.fzf
    pkgs.fd
    pkgs.ripgrep
    pkgs.bat
    pkgs.jq
  ];

  fonts.packages = [
    pkgs.sketchybar-app-font
    pkgs.nerd-fonts.fira-code
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

  # Karabiner configuration also managed in ../../karabiner
  # services.karabiner-elements.enable = true;

  # JankyBorders configuration also managed in ../../borders
  services.jankyborders.enable = true;

  # skhd configuration also managed in ../../skhd
  services.skhd.enable = true;

  # yabai configuration also managed in ../../yabai
  services.yabai.enable = true;
  system.defaults.spaces.spans-displays = false;
  system.defaults.finder.CreateDesktop = true;
  system.defaults.dock.mru-spaces = false;
  system.defaults.WindowManager.StandardHideDesktopIcons = false;
  system.defaults.WindowManager.EnableStandardClickToShowDesktop = false;

  # Sketchybar configuration also managed in ../../sketchybar
  services.sketchybar.enable = true;
  services.sketchybar.extraPackages = [
    pkgs.lua5_4_compat  
    pkgs.switchaudio-osx
    pkgs.nowplaying-cli
  ];
  system.defaults.NSGlobalDomain._HIHideMenuBar = true;
  system.activationScripts.applications.text = ''
    echo "Installing sketchybar deps ..."
    (git clone https://github.com/FelixKratz/SbarLua.git /tmp/SbarLua && cd /tmp/SbarLua/ && make install && rm -rf /tmp/SbarLua/)
  '';

  # AeroSpace configuration also managed in ../../aerospace
  # services.aerospace.enable = true;
  # system.defaults.dock.expose-group-apps = true;
  # system.defaults.spaces.spans-displays = true;
  # system.defaults.NSGlobalDomain.NSAutomaticWindowAnimationsEnabled = false;

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
    "/Applications/Ghostty.app"
  ];
}

