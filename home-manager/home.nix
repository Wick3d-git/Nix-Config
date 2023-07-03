{
  pkgs,
  lib,
  ...
}: {
  imports = [
  ./apps/dunst.nix
  ./apps/fzf.nix
  ./apps/kitty.nix 
  ./apps/spicetify.nix 
  ./apps/zsh.nix 
  ./apps/swaylock.nix
  ./apps/hyprland.nix
  ./apps/rofi.nix 
  ./apps/waybar.nix
  ];

  home = {
    username = "wick3d";
    homeDirectory = "/home/wick3d";
    stateVersion = "23.05";
    packages = with pkgs; [ 
      grim
    ];
  };
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
  wayland.windowManager.hyprland = {
    xwayland.enable = true;
  };
  nixpkgs.config.allowUnfreePredicate = pkg:
    builtins.elem (lib.getName pkg) [
      "spotify"
    ];
}
