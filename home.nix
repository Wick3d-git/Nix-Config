{ config, pkgs, lib, ... }:

#let
#  nixvim = import (builtins.fetchGit {
#    url = "https://github.com/nix-community/nixvim";
#    ref = "main";
#  });
#in
{
#  imports = [ nixvim.homeManagerModules.nixvim ];

  home.username = "wick3d";
  home.homeDirectory = "/home/wick3d";
  home.stateVersion = "23.11"; # Please read the comment before changing.
  home.packages = with pkgs; [
    appimage-run
    bitwarden
    btop
    cargo
    cz-cli
    dconf
    dunst
    eza
    floorp
    gamemode
    gcc
    git
    gitkraken
    gnumake
    libdrm
    libnotify
    mangohud
    nodePackages_latest.live-server
    nodePackages.vscode-langservers-extracted
    nodePackages_latest.vim-language-server
    neofetch
    neovim
    nerdfonts
    nodejs
    pamixer
    pavucontrol
    pcmanfm
    playerctl
    protonup-qt
    pyprland
    python
    ranger
    rofi-wayland
    ryujinx
    swaybg
    ueberzug
    unrar
    unzip
    vesktop
    via
    wget
    wlprop
  ];
  gtk = {
    enable = true;
    theme.package = pkgs.nordic;
    theme.name = "Nordic";
    iconTheme.package = pkgs.nordzy-icon-theme;
    iconTheme.name = "Nordzy";
    font = {
      name = "JetBrainsMono Nerd Font";
      size = 12;
    };

  };
  xdg.portal.enable = true;
  xdg.portal.config = { common = { default = [ "hyprland" ]; }; };
  xdg.portal.extraPortals = with pkgs; [ xdg-desktop-portal-hyprland ];
  wayland.windowManager.hyprland.enable = true;
  wayland.windowManager.hyprland.systemd.enable = false;
  fonts.fontconfig.enable = true;
  programs.home-manager.enable = true;
  programs.git = {
    enable = true;
    userName = "Anthony Abaray";
    userEmail = "122565774+Wick3d-git@users.noreply.github.com";
    extraConfig = {
      init.defaultBranch = "main";
    };
  };
  nixpkgs = {
    config = {
      permittedInsecurePackages = [ "python-2.7.18.7" "nix-2.15.3" ];
      allowUnfree = true;
    };

  };

}
