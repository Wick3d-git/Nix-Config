{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    shellAliases = {
      ls = "exa --icons";
      nsc = "nvim ~/NixOS-Config/configuration-desktop.nix";
      nrs = "sudo nixos-rebuild switch --flake 'NixOS-Config/'";
      hsc = "nvim ~/NixOS-Config/home.nix";
      hrs = "home-manager switch --impure --flake 'NixOS-Config/'";
      nsgc = "nix store gc";
      v = "nvim";
      vim = "nvim";
      tb = "appimage-run ~/Downloads/TB.AppImage";
    };
    initExtra = ''
      PROMPT='%F{blue}  %1~%f%F{white} |%  '
      neofetch
      export EDITOR='nvim'
      export TERMINAL='kitty'
      export BROWSER='chromium'
      export TERM='kitty'
    '';
  };
}
