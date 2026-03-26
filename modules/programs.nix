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
    xorg.libX11 xorg.libXext xorg.libXrender xorg.libxcb
    xorg.libXrandr xorg.libXi xorg.libXtst xorg.libXcursor
    xorg.libXcomposite xorg.libXdamage xorg.libXfixes
    libxkbcommon alsa-lib libpulseaudio gtk3 fuse2
  ];
}
