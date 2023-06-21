{
  pkgs,
  config,
  lib,
  ...
}: {
  home.packages = with pkgs; [ ];
  programs.rofi = {
    enable = true;
    extraConfig = {
      modi = "run,ssh,drun";
      display-drun = " ";
      icon-theme = "Nordzy";
      show-icons = true;
    };
    package = pkgs."rofi-wayland";
    theme = "/home/wick3d/.config/rofi/onedark.rasi";
  };
}
