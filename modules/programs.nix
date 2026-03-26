{ config, pkgs, ... }:

{
  programs = {
    firefox.enable = true;
    zsh.enable = true;

    thunar.enable = true;
    hyprland.enable = true;
    appimage.enable = true;

    nix-ld.enable = true;
  };

  programs.nix-ld.libraries = with pkgs; [
    stdenv.cc.cc zlib glib nss nspr
    libx11 libxext libxrender libxcb
    libxrandr libxi libxtst libxcursor
    libxcomposite libxdamage libxfixes
    libxkbcommon alsa-lib libpulseaudio gtk3 fuse2
  ];
}
