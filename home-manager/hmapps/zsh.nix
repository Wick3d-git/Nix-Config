{ config, ... }:
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
      fsc = "nvim ${dir}/NixOS-Config/flake.nix";
      nhl = "nvim ${dir}/NixOS-Config/home-manager/hmapps/Hyprland/hyprland.nix";
      nhp = "nvim ${dir}/NixOS-Config/home-manager/hmapps/Hyprland/hyprpanel.nix";
      nfu = "nix flake update --flake ${dir}/NixOS-Config/";
      nsgc = "sudo nix-collect-garbage --delete-old";
      rcc = "rclone copy Notes/ Proton-Drive:Docs/Notes/";
      rcl = "rclone copy Proton-Drive:Docs/Notes/ Notes/";
      ".." = "cd ..";
      "..." = "cd ../..";
      "...." = "cd ../../..";
      "....." = "cd ../../../..";
      g = "git";
      ga = "git add";
      gc = "git commit";
      gp = "git push";
      gpl = "git pull";
      gs = "git status";
    };
    initExtra = ''
      PROMPT='%F{blue}  %1~%f%F{white} |%  '
      neofetch
      export EDITOR='nvim'
      export TERMINAL='ghostty'
      export BROWSER='chromium'
      export TERM='ghostty'
    '';
  };
}
