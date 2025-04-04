{
  description = "Home Manager configuration of jorge-pb";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-24.05";
    nixos-wsl = {
      url = "github:nix-community/NixOS-WSL";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim.url = "github:dc-tec/nixvim";
  };

  outputs = {
    nixpkgs,
    nixpkgs-stable,
    nixos-wsl,
    home-manager,
    nixvim,
    ... 
  }: let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
        inherit system;

        modules = [
          ./configuration.nix

          nixos-wsl.nixosModules.wsl

          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;

            home-manager.users.jorge = import ./home/personal.nix;
            home-manager.extraSpecialArgs = {
              inherit nixvim;
              pkgs-stable = import nixpkgs-stable {
                inherit system;
                config.allowUnfree = true;
              };
            };
          }
        ];
      };
      homeConfigurations = {
        "jorge-pb@jorgepb-hp" = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;

          extraSpecialArgs = {
            inherit nixvim;
            pkgs-stable = import nixpkgs-stable {
              inherit system;
            };
          };

          modules = [ ./home/work.nix ];
        };

        "jorge" = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;

          modules = [ ./home/personal.nix ];

          extraSpecialArgs = {
            inherit nixvim;
            pkgs-stable = import nixpkgs-stable {
              inherit system;
              config.allowUnfree = true;
            };
          };
      };
      };
    };
}

