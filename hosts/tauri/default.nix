{
  imports = [
    ./hardware-configuration.nix
    ../../system
  ];
  networking.hostName = "tauri";
}
