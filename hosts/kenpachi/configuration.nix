{ config, pkgs, ... }: {
	imports = [
		./hardware-configuration.nix

		../../modules/system.nix
		../../modules/services.nix
		../../modules/packages.nix
		../../modules/programs.nix
		../../modules/users.nix
		../../modules/fonts.nix
		../../modules/networking.nix
		];
	}
