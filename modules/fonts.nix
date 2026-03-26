{ config, pkgs, ... }: {
    fonts.packages  = with pkgs; [
        jetbrains-mono 
        noto-fonts
        nerd-fonts.jetbrains-mono 
        nerd-fonts.caskaydia-cove
        noto-fonts-color-emoji

    ];
    }
