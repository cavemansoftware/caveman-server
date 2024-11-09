{
  imports = [
    ./security.nix
    ./users.nix
    ./nix.nix
    ../../modules/tailscale
  ];
  system.stateVersion = "24.11";
}
