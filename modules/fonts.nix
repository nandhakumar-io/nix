{ config, pkgs, ... }: {
    fonts.packages  = with pkgs; [
        jetbrains-mono 
        noto-fonts
        nerd-fonts.jetbrains-mono 
        nerd-fonts.caskayadi-cove
        noto-fonts-color-emoji

    ];
    }
