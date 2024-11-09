{
  imports = [
    ./hardware-configuration.nix
    # userland niceness
    ../../system/core
    ../../modules/nginx
  ];
  networking.hostName = "tauri";
}
