{
  description = "My first flake";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    nixvim.url = "github:nix-community/nixvim";
    nixvim.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    spicetify-nix.url = "github:the-argus/spicetify-nix";
    hyprland.url = "github:hyprwm/Hyprland";
  };

  outputs =
    { self, nixpkgs, home-manager, spicetify-nix, hyprland, ... }@inputs:
    let
      lib = nixpkgs.lib;
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      nixosConfigurations = {
        NixOS-Testing = lib.nixosSystem {
          inherit system;
          modules = [ ./configuration.nix ];
        };
      };
      homeConfigurations = {
        wick3d = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [
            ./home.nix
            ./hmapps/dunst.nix
            ./hmapps/fzf.nix
            ./hmapps/hyprland.nix
            ./hmapps/kitty.nix
            ./hmapps/nixvim.nix
            ./hmapps/rofi.nix
            ./hmapps/spicetify.nix
            ./hmapps/swaylock.nix
            ./hmapps/zsh.nix
            ./hmapps/waybar.nix
            ./hmapps/wlogout.nix
          ];
          extraSpecialArgs = inputs;
        };
      };
    };
}
