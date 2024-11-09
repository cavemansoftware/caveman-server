{
  imports = [
    ./hardware-configuration.nix
    ../../system/core
  ];
  networking.hostName = "tauri";
}
