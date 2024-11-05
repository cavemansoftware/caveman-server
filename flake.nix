{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs = {
    self,
    nixpkgs,
    ...
  } @ inputs: let
    inherit (self) outputs;
    pkgs = inputs.nixpkgs.legacyPackages.x86_64-linux;
  in {
    nixosConfigurations = {
      tauri = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit self inputs outputs;};
        modules = [./hosts/tauri];
      };
    };
    formatter.x86_64-linux = pkgs.alejandra;
  };
}
