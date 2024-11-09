{
  description = "Caveman Software Official Server Modules";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    pre-commit-hooks = {
      url = "github:cachix/pre-commit-hooks.nix";
      inputs. 
        nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    ...
  } @ inputs: let
    inherit (self) outputs;
    pkgs = inputs.nixpkgs.legacyPackages.legacyPackages.x86_64-linux;
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
