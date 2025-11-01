{
  description = "Media Desktop";

  inputs = {

    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";

    home-manager = {
        url = "github:nix-community/home-manager/release-25.05";
        inputs.nixpkgs.follows = "nixpkgs";
    };

    plasma-manager = {
        url = "github:nix-community/plasma-manager";
        inputs.nixpkgs.follows = "nixpkgs";
        inputs.home-manager.follows = "home-manager";
    };

  };

  outputs = inputs @ { nixpkgs, home-manager, plasma-manager, ... }:
  
  {
    nixosConfigurations = {

      akila = nixpkgs.lib.nixosSystem {

        system = "x86_64-linux";

        modules = [
          ./host/default.nix

          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.magnus = ./home/default.nix;
            home-manager.extraSpecialArgs = {
                username = "magnus";
            };
            home-manager.sharedModules = [ plasma-manager.homeModules.plasma-manager ];
          }
        ];

      };

    };
  };
}