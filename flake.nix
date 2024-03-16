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
    chaotic.url = "github:chaotic-cx/nyx/nyxpkgs-unstable";
  };

  outputs =
    { self, nixpkgs, home-manager, spicetify-nix, hyprland, chaotic, ... }@inputs:
    let
      lib = nixpkgs.lib;
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      nixosConfigurations = {
        NixOS-Testing = lib.nixosSystem {
          inherit system;
          modules = [ ./configuration.nix chaotic.nixosModules.default ];
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
#            ./hmapps/nixvim.nix
            /home/wick3d/nix-config/hmapps/pypr.nix
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
