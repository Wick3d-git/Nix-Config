{
  inputs,
  pkgs,
  ...
}:
{
  imports = [
    inputs.spicetify-nix.homeManagerModules.default
    inputs.stylix.homeManagerModules.stylix
    inputs.nixvim.homeManagerModules.nixvim
    ./hmapps/Hyprland/hyprland.nix
    ./hmapps/Hyprland/hyprpaper.nix
    ./hmapps/Hyprland/hyprshade.nix
    ./hmapps/Hyprland/hyprpanel.nix
    ./hmapps/Hyprland/hyprlock.nix
    ./hmapps/Hyprland/hypridle.nix
    ./hmapps/Hyprland/pypr.nix
    ./hmapps/ghostty.nix
    ./hmapps/rofi.nix
    ./hmapps/neofetch.nix
    ./hmapps/wlogout.nix
    ./hmapps/fzf.nix
    ./hmapps/zsh.nix
    ./hmapps/spicetify.nix
    ./hmapps/stylix.nix
    ./hmapps/Nixvim/nixvim.nix
  ];

  nixpkgs = {
    config = {
      allowUnfree = true;
      allowUnfreePredicate = _: true;
    };
    overlays = [
      inputs.rust-overlay.overlays.default
    ];
  };

  home = {
    username = "wick3d";
    homeDirectory = "/home/wick3d";
  };
  home.packages = with pkgs; [
    bat
    bitwarden-desktop
    black
    brave
    ente-auth
    eza
    file-roller
    gcc
    hclfmt
    hyprshade
    lexend
    material-design-icons
    markdownlint-cli
    neofetch
    nerd-fonts.fira-code
    nerd-fonts.iosevka
    nerd-fonts.jetbrains-mono
    nixfmt-rfc-style
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-emoji
    obsidian
    pamixer
    pavucontrol
    playerctl
    prettierd
    protonmail-desktop
    pulsemixer
    pyprland
    rclone
    roboto
    rubik
    rust-bin.nightly.latest.default
    shfmt
    stylua
    ungoogled-chromium
    unzip
    webcord-vencord
    yamlfmt
    yazi
    zip
  ];

  nixpkgs.config.permittedInsecurePackages = [
    "electron-31.7.7"
  ];

  gtk = {
    enable = true;
    iconTheme.package = pkgs.nordzy-icon-theme;
    iconTheme.name = "Nordzy-dark";
  };

  fonts.fontconfig.enable = true;

  programs.home-manager.enable = true;
  programs.git = {
    enable = true;
    extraConfig = {
      init.defaultBranch = "main";
    };
  };

  systemd.user.startServices = "sd-switch";

  home.stateVersion = "24.11";
}
