{
  description = "Vladimir Ovechkin`s nix config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    mac-app-util.url = "github:hraban/mac-app-util";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ self, nix-darwin, home-manager, nixpkgs, mac-app-util }:
    {
      darwinConfigurations."spb-hq-nb-1355" = nix-darwin.lib.darwinSystem {
        modules = [
          ./hosts/spb-hq-nb-1355/darwin.nix
          mac-app-util.darwinModules.default
          home-manager.darwinModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.verbose = true;
            home-manager.users.spb-hq-nb-1355.imports = [
              ./hosts/spb-hq-nb-1355/home.nix
              mac-app-util.homeManagerModules.default
            ];
          }
        ];
      };
    };
}
