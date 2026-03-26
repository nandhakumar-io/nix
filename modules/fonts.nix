{ config, pkgs, ... }: {
    fonts.packages = [
        pkgs.jetbrains-mono
        pkgs.noto-fonts
        pkgs.noto-fonts-color-emoji
    ];
}
