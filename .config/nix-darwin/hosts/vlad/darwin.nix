{ ... }:
{
  imports = [
    ../../darwin
  ];

  nixpkgs.hostPlatform = "aarch64-darwin";
  security.pam.enableSudoTouchIdAuth = true;

  # users.users.spb-hq-nb-1355 = {
  #   name = "spb-hq-nb-1355";
  #   home = "/Users/spb-hq-nb-1355";
  # };
}
