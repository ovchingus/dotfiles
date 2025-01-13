{
  description = "Vladimir Ovechkin nix-darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    mac-app-util.url = "github:hraban/mac-app-util";
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs, mac-app-util }:
  let
    configuration = { pkgs, ... }: {
      # List packages installed in system profile. To search by name, run:
      # $ nix-env -qaP | grep wget
      environment.systemPackages = [
        pkgs.neovim
        pkgs.stow
        pkgs.nodejs_22
        pkgs.iterm2
        pkgs.google-chrome
        pkgs.telegram-desktop
      ];

      environment.variables = {
        EDITOR = "nvim";
      };

      fonts.packages = [
        pkgs.nerd-fonts.fira-code
      ];

      nixpkgs.config.allowUnfree = true;

      # Necessary for using flakes on this system.
      nix.settings.experimental-features = "nix-command flakes";

      # Enable alternative shell support in nix-darwin.
      # programs.fish.enable = true;

      # Set Git commit hash for darwin-version.
      system.configurationRevision = self.rev or self.dirtyRev or null;

      # Used for backwards compatibility, please read the changelog before changing.
      # $ darwin-rebuild changelog
      system.stateVersion = 5;

      # The platform the configuration will be used on.
      nixpkgs.hostPlatform = "aarch64-darwin";

      programs.zsh.enable = true;
      programs.zsh.enableSyntaxHighlighting = true;

      services.jankyborders.enable = true;
      services.sketchybar.enable = true;
      services.skhd.enable = true;
      services.yabai.enable = true;

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
    };
  in
  {
    # Build darwin flake using:
    # $ darwin-rebuild build --flake .#workstation
    darwinConfigurations."workstation"= nix-darwin.lib.darwinSystem {
      modules = [
        configuration
        mac-app-util.darwinModules.default
      ];
    };
  };
}
