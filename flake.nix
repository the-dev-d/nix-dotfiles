{
  description = "The-Dev-D Official laptop nix configurations";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-25.05";
  };

  outputs = { self, nixpkgs }: 
  let
    lib = nixpkgs.lib;
  in
  {
    nixosConfigurations = {
      nixos = lib.nixosSystem {
        system = "x86_64-linux";
        modules = [./configuration.nix];
      };
    };
  };
}
