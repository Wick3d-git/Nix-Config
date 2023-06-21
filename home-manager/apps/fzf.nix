{
  pkgs,
  config,
  lib,
  ...
}: {
  home.packages = with pkgs; [ ];
  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };
}
