{ 
  pkgs,
  config,
  lib,
  ...
}: {
  home.packages = with pkgs; [ ];
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    enableAutosuggestions=true;
    enableSyntaxHighlighting = true;
    shellAliases = {
       ls = "exa --icons";
       nsc = "sudo -e /etc/nixos/configuration.nix";
       nrs = "sudo nixos-rebuild switch";
       hsc = "nvim ~/.config/home-manager/home.nix";
       hrs = "home-manager switch";
       nsgc = "nix store gc";
      };
      initExtra = ''
        PROMPT='%F{blue}  %1~%f%F{white} |%  '
        neofetch
        export EDITOR='nvim'
        export TERMINAL='kitty'
        export BROWSER='brave'
        export TERM='kitty'
      '';
  };
}
