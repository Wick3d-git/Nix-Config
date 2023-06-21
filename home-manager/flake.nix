{
  description = "My home-manager configuration";
  inputs = {
    nixpkgs.url = github:NixOS/nixpkgs?ref=nixos-23.05;
    spicetify-nix.url = github:the-argus/spicetify-nix;
    home-manager = {
      url = github:nix-community/home-manager/release-23.05;
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland.url = "github:hyprwm/Hyprland";
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    spicetify-nix,
    hyprland,
  } @ inputs: let
    username = "wick3d";
    hostname = "NixOS";

    homeConfigUserString =
      if username == "unknown_username"
      then abort "Please replace \"unknown_username\" in flake.nix with your actual username."
      else "${username}@${hostname}";

    supportedSystems = [
      "x86_64-linux"
      "aarch64-linux"
    ];
    genSystems = nixpkgs.lib.genAttrs supportedSystems;
    pkgs = genSystems (system: import nixpkgs {inherit system;});

    perSystem = { config, self', inputs', pkgs, system, ...}: {
      packages = {
        wick3d-nvim = pkgs.vimUtils.buildVimPlugin {
          name = "wick3d";
          src = /home/wick3d/.config/nvim; 
        };
      };
    };

    # not these though
    stateVersion = "22.11";
  in {
    packages = genSystems (system: {
      homeConfigurations.${homeConfigUserString} = home-manager.lib.homeManagerConfiguration {
        pkgs = pkgs.${system};
        modules = [ hyprland.homeManagerModules.default
        {wayland.windowManager.hyprland.enable = true;}
        ./home.nix];
        extraSpecialArgs =
          inputs
          // {
            inherit username stateVersion;
          };
      };
    });
  };
}
