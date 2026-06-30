{
  description = "System Nix os configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-26.05";
    unstable.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    determinate.url = "https://flakehub.com/f/DeterminateSystems/determinate/*";
    nvf = {
      url = "github:NotAShelf/nvf";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    stylix = {
      url = "github:nix-community/stylix/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-doom-emacs-unstraightened = {
      url = "github:marienz/nix-doom-emacs-unstraightened";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    oh-my-pi-nix = {
      url = "github:bjin/oh-my-pi-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    slang-nvim = {
      url = "github:pixelsandpointers/slang.nvim";
      flake = false;
    };
  };

  outputs = {
    self,
    nixpkgs,
    unstable,
    determinate,
    home-manager,
    stylix,
    ...
  } @ inputs: {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      specialArgs = {
        inherit inputs;
      };
      modules = [
        ./configuration.nix
        determinate.nixosModules.default
        inputs.nvf.nixosModules.default
        stylix.nixosModules.stylix
        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.extraSpecialArgs = {inherit inputs;};
          home-manager.users.shivang = {
            imports = [
              ./home.nix
            ];
          };
        }
      ];
    };
  };
}
