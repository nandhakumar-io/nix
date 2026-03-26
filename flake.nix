{
    description = " My First NixOS flake";

    inputs = {
        nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
        home-manager.url = "github:nix-community/home-manager";
        home-manager.inputs.nixpkgs.follows = "nixpkgs";
    };

    outputs = { self, nixpkgs, home-manager}: {
        nixosConfigurations.AsusVivobookS15 = nixpkgs.lib.nixosSystem {
                system = "x86_64-linux";
                
                modules = [
                    ./hosts/kenpachi/configuration.nix
                    home-manager.nixosModules.home-manager

                     {
                        home-manager.useGlobalPkgs = true;
                        home-manager.useUserPackages = true;

                        home-manager.users.kenpachi-zaraki =
                        import ./home/kenpachi/home.nix;
  }
                ];

            };
        };
    }
