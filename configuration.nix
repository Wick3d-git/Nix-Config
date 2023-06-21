{ config, pkgs, ... }:

{
  imports = [ ./hardware-configuration.nix ];

  boot = {
    loader = {
    	grub = {
    	  device = "nodev";
    	  efiSupport = true;
    	  gfxmodeEfi = "1920x1080";
    	  useOSProber = true;
        };
	efi = {
	  canTouchEfiVariables = true;
	  efiSysMountPoint = "/boot";
	};
    };
    initrd = {
    	kernelModules = [ "amdgpu" ];
    };
    supportedFilesystems = [ "ntfs" ];
  };

  networking = {
    hostName = "NixOS";
    networkmanager.enable = true;
  };

  time.timeZone = "America/New_York";

  nixpkgs = {
    config = {
	    permittedInsecurePackages = [ "python-2.7.18.6" ];
      allowUnfree = true;
    };
  };  

  services = {
    xserver = {
	    enable = true;
      displayManager.startx.enable = true;
    	layout = "us";
    	xkbVariant = "";
      videoDrivers = [ "amdgpu" "radeon" ];
    };
    pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    };
    flatpak = { 
      enable = true;
    };
  };
  
  hardware = {
    cpu.amd.updateMicrocode = true;
    enableRedistributableFirmware = true;
    opengl.enable = true;
    pulseaudio.enable = false;
    opengl.driSupport = true;
    opengl.driSupport32Bit = true;
    opengl.setLdLibraryPath = true;
  };

  programs = {
   zsh.enable = true;
   steam.enable = true;
   dconf.enable = true;
  };
  xdg.portal.enable = true;
  xdg.portal.extraPortals = with pkgs; [
    xdg-desktop-portal-wlr
    xdg-desktop-portal-hyprland
  ];
  fonts.fonts = with pkgs; [ nerdfonts ];

  i18n = {
    defaultLocale = "en_US.UTF-8";
    extraLocaleSettings = {
    	LC_ADDRESS = "en_US.UTF-8";
 	LC_IDENTIFICATION = "en_US.UTF-8";
    	LC_MEASUREMENT = "en_US.UTF-8";
    	LC_MONETARY = "en_US.UTF-8";
    	LC_NAME = "en_US.UTF-8";
    	LC_NUMERIC = "en_US.UTF-8";
    	LC_PAPER = "en_US.UTF-8";
    	LC_TELEPHONE = "en_US.UTF-8";
    	LC_TIME = "en_US.UTF-8";
    };
  };
  security = {
    pam.services.swaylock = {
        text = ''
          auth include login
        '';
      };
    rtkit.enable = true;
  };

  users.users."username" = {
    isNormalUser = true;
    description = "RealName";
    extraGroups = [ "networkmanager" "wheel"];
    shell = pkgs.zsh;
    packages = with pkgs; [];
  };

   environment.systemPackages = with pkgs; [
    betterdiscordctl
    bitwarden
    brave
    btop
    caffeine-ng
    cargo
    discord
    dunst
    exa
    feh
    gcc
    git
    gnumake
    home-manager
    libdrm
    libnotify
    lutris
    neofetch
    neovim
    nodePackages.pyright
    nodePackages.vscode-langservers-extracted
    nodePackages_latest.live-server
    nodePackages_latest.vim-language-server
    nodejs
    pamixer
    pavucontrol
    pcmanfm
    playerctl
    python
    python310Packages.pylsp-mypy
    python310Packages.pynvim
    python310Packages.python-lsp-server
    python311
    ranger
    ripgrep
    rofi-wayland
    scrot
    spotify 
    swaybg
    tmux
    universal-ctags
    unzip
    vim-vint    
    waybar
    wineWowPackages.stable
    winetricks
    wget
    wlogout
  ];

  nix = {
   settings = {
   	auto-optimise-store = true;
   	experimental-features = [ "nix-command" "flakes" ];
   };
   gc = {
   	automatic = true;
   	dates = "weekly";
   	options = "--delete-older-than 7d";
   };
  };
  nixpkgs.overlays = [
    (self: super: {
      waybar = super.waybar.overrideAttrs (oldAttrs: {
        mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true" ];
      });
    })
  ];

  system = {
  autoUpgrade.enable = true;
  stateVersion = "23.05"; 
  };
}
