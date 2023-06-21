{
  pkgs,
  config,
  lib,
  ...
}: {
  home.packages = with pkgs; [ ];
  programs.swaylock = {
    enable = true;
    package = pkgs."swaylock-effects";
    settings = {
      bs-hl-color = "31748f";
      clock = true; 
      color = "2e344099";
      daemonize = true;
      datestr = "%m/%d/%Y";
      effect-blur = "2x2";
      font = "JetBrainsMono Nerd Font";
      font-size = 35;
      grace = 0;
      grace-no-mouse = true; 
      grace-no-touch = true; 
      ignore-empty-password = true;
      indicator = true;
      indicator-thickness = 10;
      inside-clear-color = "1f1d2e";
      inside-color = "2e3440";
      inside-ver-color = "1f1d2e";
      inside-wrong-color = "000000";
      key-hl-color = "ffffff";
      line-clear-color = "1f1d2e";
      line-color = "3b4252";
      line-ver-color = "2e3440";
      line-wrong-color = "1f1d2e";
      ring-clear-color = "9ccfd8";
      ring-color = "4c566a";
      ring-ver-color = "ffffff";
      ring-wrong-color = "31748f";
      text-caps-lock-color = "bf616a";
      text-clear-color = "e0def4";
      text-color = "ffffff";
      text-ver-color = "e0def4";
      text-wrong-color = "31748f";
      timestr = "%H:%M";
    };
  };
}
