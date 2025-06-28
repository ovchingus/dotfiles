{ ... }:
{
  imports = [
    ../../darwin
  ];

  nixpkgs.hostPlatform = "aarch64-darwin";
  security.pam.enableSudoTouchIdAuth = true;
}
