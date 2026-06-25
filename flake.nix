{
  description = "System Nix os configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-26.05";
    unstable.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { self, nixpkgs, unstable, ...} @ inputs: {

   nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
   	modules = [ ./configuration.nix ];
    };
  };
}
