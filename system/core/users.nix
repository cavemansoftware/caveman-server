{pkgs, ...}: {
  users.users.admin = {
    isNormalUser = true;
    shell = pkgs.zsh;
    extraGroups = ["wheel" "nix"];
    initialPassword = "iwillchangethispassword";
  };
  programs.zsh.enable = true;
}
