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
    nur.url = "github:nix-community/NUR";
    disko.url = "github:nix-community/disko";
    disko.inputs.nixpkgs.follows = "nixpkgs";
    sops-nix.url = "github:Mic92/sops-nix";
  };

  outputs = { self, nixpkgs, home-manager, spicetify-nix, hyprland, chaotic
    , nixvim, nur, disko, sops-nix, ... }@inputs:
    let
      lib = nixpkgs.lib;
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      nixosConfigurations = {
        NixOS-Testing = lib.nixosSystem {
          inherit system;
          modules = [ ./configuration-desktop.nix chaotic.nixosModules.default disko.nixosModules.default sops-nix.nixosModules.sops ];
        };
        NixOS-Laptop-Testing = lib.nixosSystem {
          inherit system;
          modules = [ ./configuration-laptop.nix chaotic.nixosModules.default ];
        };
      };
      homeConfigurations = {
        wick3d = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [
            ./home.nix
            ./hmapps/dunst.nix
            ./hmapps/fzf.nix
            ./hmapps/hyprpaper.nix
            ./hmapps/hyprshade.nix
            ./hmapps/hyprlock.nix
            ./hmapps/hyprland.nix
            ./hmapps/kitty.nix
            ./hmapps/neofetch.nix
            ./hmapps/nixvim/nixvim.nix
            ./hmapps/pypr.nix
            ./hmapps/rofi.nix
            ./hmapps/screenshot.nix
            ./hmapps/spicetify.nix
            ./hmapps/swaylock.nix
            ./hmapps/zsh.nix
            ./hmapps/waybar.nix
            ./hmapps/wlogout.nix
            nixvim.homeManagerModules.nixvim
          ];
          extraSpecialArgs = inputs;
        };
      };
    };
}
