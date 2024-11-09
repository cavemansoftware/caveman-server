{inputs, ...}: {
  system = {
    switch = {
      enable = false;
      enableNg = true;
    };
  };
  nix = {
    settings = {
      trusted-users = ["root" "@wheel"];
      keep-going = true;
      warn-dirty = false;
      auto-optimize-store = true;
      builders-use-substitutes = true;
      experimental-features = ["nix-command" "flakes"];
    };
  };
}
