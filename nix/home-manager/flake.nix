{
  description = "Home Manager configuration of jorge-pb";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-24.05";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim.url = "github:dc-tec/nixvim";
  };

  outputs = {
    nixpkgs,
    nixpkgs-stable,
    home-manager,
    nixvim,
    ... 
  }: let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in {
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
