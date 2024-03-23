{ pkgs, ... }:

{
  imports = [ ./hardware-configuration.nix ];
  hardware = {
    cpu.amd.updateMicrocode = true;
    enableRedistributableFirmware = true;
    opengl.enable = true;
    pulseaudio.enable = false;
    opengl.driSupport = true;
    opengl.driSupport32Bit = true;
    opengl.setLdLibraryPath = true;
  };
  boot = {
    loader = {
      grub = {
        device = "nodev";
        efiSupport = true;
        gfxmodeEfi = "2560x1440";
        useOSProber = true;
      };
      efi = {
        canTouchEfiVariables = true;
        efiSysMountPoint = "/boot";
      };
    };
    supportedFilesystems = [ "ntfs" ];
    kernelPackages = pkgs.linuxPackages_cachyos;
  };
  networking.hostName = "NixOS-Testing";
  networking.networkmanager.enable = true;
  time.timeZone = "America/New_York";
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
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
  sound.enable = true;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };
  users.users.wick3d = {
    isNormalUser = true;
    description = "Anthony Abaray";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.zsh;
    packages = with pkgs; [ hyprshade ];
  };
   fonts.packages = with pkgs; [
    rubik
    lexend
    material-design-icons
    lexend
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    roboto
    (nerdfonts.override {fonts = ["FiraCode" "Iosevka" "JetBrainsMono"];})
  ];
  nixpkgs.config.allowUnfree = true;
  security.pam.services.swaylock.text = "auth include login ";
  services.resolved = {
    enable = true;
    extraConfig = "";
  };
  services.mullvad-vpn.enable = true;
  services.mullvad-vpn.package = pkgs.mullvad-vpn;
  programs.zsh.enable = true;
  programs.steam.enable = true;
  programs.dconf.enable = true;
  environment.systemPackages = with pkgs; [ git ];
  system.stateVersion = "23.11";
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nix.gc.automatic = true;
  nix.gc.dates = "weekly";
  nix.gc.options = "--delete-older-than 2d";

}
