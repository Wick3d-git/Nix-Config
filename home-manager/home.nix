{
  inputs,
  pkgs,
  ...
}: {
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
  };

  home = {
    username = "wick3d";
    homeDirectory = "/home/wick3d";
  };

  home.packages = with pkgs; [
    alejandra
    bat
    bitwarden-cli
    bitwarden-desktop
    black
    ente-auth
    eza
    gamemode
    lexend
    material-design-icons
    neofetch
    nerd-fonts.fira-code
    nerd-fonts.iosevka
    nerd-fonts.jetbrains-mono
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-emoji
    pamixer
    pavucontrol
    playerctl
    prettierd
    protonmail-desktop
    pulsemixer
    pyprland
    roboto
    rubik
    stylua
    webcord-vencord
    yamlfmt
    yazi
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
    userName = "Anthony Abaray";
    userEmail = "122565774+Wick3d-git@users.noreply.github.com";
    extraConfig = {init.defaultBranch = "main";};
  };

  systemd.user.startServices = "sd-switch";

  home.stateVersion = "24.11";
}
