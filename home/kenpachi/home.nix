{ config, pkgs, ... }: {
  home.username = "kenpachi-zaraki";
  home.homeDirectory = "/home/kenpachi-zaraki";
  home.stateVersion = "24.05";

  home.packages = with pkgs; [
  
  # ✅ Proper Python environment with pygame
  (python313.withPackages (ps: with ps; [
    pygame
  ]))

  # ✅ REQUIRED runtime libs (force availability)
  zlib
  libGL
  SDL2
  SDL2_image
  SDL2_mixer
  SDL2_ttf
  freetype
  fontconfig
];
home.sessionPath = [
  "$HOME/openldap/bin"
  "$HOME/openldap/libexec"
];

  programs.zsh.enable = true;

  programs.kitty.enable = true;

  programs.rofi.enable = true;

  programs.starship.enable = true;

  programs.zoxide = {
        enable = true;
        enableZshIntegration = true;
    };

  programs.tmux = {
    enable = true;

    plugins = with pkgs.tmuxPlugins; [
      sensible
      resurrect
      continuum
      yank
      battery
      vim-tmux-navigator
      fzf-tmux-url
    ];
  };

  programs.bat.enable = true;

  services.dunst.enable = true;



  xdg.configFile."dunst".source = ./config/dunst;
  xdg.configFile."hypr".source = ./config/hypr;
  xdg.configFile."kitty".source = ./config/kitty;
  xdg.configFile."nvim".source = ./config/nvim;
  xdg.configFile."rofi".source = ./config/rofi;
  xdg.configFile."tmux".source = ./config/tmux;
  xdg.configFile."zsh".source = ./config/zsh;
  xdg.configFile."scripts".source = ./config/scripts;

}
