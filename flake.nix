{
    description = " My First NixOS flake";

    inputs = {
        nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
    };

    outputs = { self, nixpkgs}: {
        nixConfigurations.AsusVivobookS15 = nixpkgs.lib.nixosSystem {
                system = "x86_64-linux";
                
                modules = [
                    ./hosts/kenpachi/configuration.nix
                ];

            };
        };
    }
