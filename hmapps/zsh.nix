{ pkgs, config, lib, ... }: {
  home.packages = with pkgs; [ ];
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    enableAutosuggestions = true;
    syntaxHighlighting.enable = true;
    shellAliases = {
      ls = "exa --icons";
      nsc = "nvim ~/nix-config/configuration.nix";
      nrs = "sudo nixos-rebuild switch --flake 'nix-config/'";
      hsc = "nvim ~/nix-config/home.nix";
      hrs = "home-manager switch --flake 'nix-config/' --impure";
      nsgc = "nix store gc";
    };
    initExtra = ''
      PROMPT='%F{blue}  %1~%f%F{white} |%  '
      neofetch
      export EDITOR='nvim'
      export TERMINAL='kitty'
      export BROWSER='floorp'
      export TERM='kitty'
    '';
  };
}
