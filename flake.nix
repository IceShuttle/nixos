{
  description = "System Nix os configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-26.05";
    unstable.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    determinate.url = "https://flakehub.com/f/DeterminateSystems/determinate/*";
  };

  outputs = { self, nixpkgs, unstable, determinate,  ...} @ inputs: {

   nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
   	specialArgs = {
	  inherit inputs;
	};
   	modules = [
	determinate.nixosModules.default
	./configuration.nix 
	];
    };
  };
}
