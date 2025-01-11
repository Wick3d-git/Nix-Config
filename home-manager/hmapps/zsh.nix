{ config, ...}:
let 
  dir = "${config.home.homeDirectory}";
in
{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    shellAliases = {
      ls = "eza --icons";
      nsc = "nvim ${dir}/NixOS-Config/nixos/configuration.nix";
      nrs = "sudo nixos-rebuild switch --flake '${dir}/NixOS-Config/'";
      hsc = "nvim ${dir}/NixOS-Config/home-manager/home.nix";
      nsgc = "nix store gc";
    };
    initExtra = ''
      PROMPT='%F{blue}  %1~%f%F{white} |%  '
      neofetch
      export EDITOR='nvim'
      export TERMINAL='ghostty'
      export BROWSER='firefox'
      export TERM='ghostty'
    '';
  };
}
