{ pkgs, ... }: {
  home.username = "wick3d";
  home.homeDirectory = "/home/wick3d";
  home.stateVersion = "23.11"; # Please read the comment before changing.
  home.packages = with pkgs; [
    brave
    dconf
    duf
    dunst
    eza
    fd
    figma-linux
    git
    grim
    hyprcursor
    hypridle
    hyprlock
    hyprpaper
    hyprpicker
    jetbrains-toolbox
    libdrm
    libnotify
    nodePackages_latest.live-server
    nodePackages.vscode-langservers-extracted
    nodePackages_latest.vim-language-server
    niv
    neofetch
    nerdfonts
    nodejs
    pamixer
    pavucontrol
    playerctl
    proton-pass
    pulsemixer
    pyprland
    python312
    ranger
    ripgrep
    rofi-wayland
    rustup
    sbctl
    slurp
    swappy
    tmux
    unrar
    unzip
    webcord
    wget
    wlprop
    zip
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
    extraConfig = { init.defaultBranch = "main"; };
  };
  nixpkgs = {
    config = {
      permittedInsecurePackages = [ "nix-2.16.2" ];
      allowUnfree = true;
    };

  };

}
