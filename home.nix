{ pkgs, ... }: {
  home.username = "wick3d";
  home.homeDirectory = "/home/wick3d";
  home.stateVersion = "23.11"; # Please read the comment before changing.
  home.packages = with pkgs; [
    ananicy-cpp
    ananicy-rules-cachyos
    bitwarden
    dconf
    duf
    dunst
    eza
    fd
    figma-linux
    figma-agent
    git
    grim
    hyprcursor
    hypridle
    hyprlock
    hyprpaper
    libdrm
    libnotify
    nodePackages_latest.live-server
    nodePackages.vscode-langservers-extracted
    nodePackages_latest.vim-language-server
    neofetch
    nerdfonts
    nodejs
    pamixer
    pavucontrol
    playerctl
    pulsemixer
    pyprland
    python
    ranger
    ripgrep
    rofi-wayland
    rustup
    slurp
    swappy
    tmux
    ungoogled-chromium
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
      permittedInsecurePackages = [ "python-2.7.18.8" "nix-2.16.2" ];
      allowUnfree = true;
    };

  };

}
