{ pkgs,lib, ... }:

let 
    sources = import /home/wick3d/NixOS-Config/nix/sources.nix;
    lanzaboote = import sources.lanzaboote;
in

{
  imports = [ ./hardware-configuration.nix ./disko.nix lanzaboote.nixosModules.lanzaboote ];
  hardware = {
    cpu.amd.updateMicrocode = true;
    enableRedistributableFirmware = true;
    graphics.enable = true;
    pulseaudio.enable = false;
    logitech.wireless.enable = true;
    logitech.wireless.enableGraphical = true;
  };
 boot = {
    loader = {
      grub = {
        device = "nodev";
        efiSupport = true;
        gfxmodeEfi = "2560x1440";
        useOSProber = true;
      };
      # systemd-boot = {
      #   enable = lib.mkForce false;
      # };
        efi = {

        canTouchEfiVariables = true;

        efiSysMountPoint = "/boot";

        };
    };
      # lanzaboote = {
      #   enable = true;
      #   pkiBundle = "/var/lib/sbctl";
      # };
    supportedFilesystems = [ "ntfs" ];
    kernelPackages = pkgs.linuxPackages_latest;
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
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
    extraConfig.pipewire = {
    "92-low-latency" = {
      "context.properties" = {
        "default.clock.rate" = 96000;
        "default.clock.quantum" = 512;
        "default.clock.min-quantum" = 512;
        "default.clock.max-quantum" = 512;
      };
    };
  };
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
    noto-fonts-cjk-sans
    noto-fonts-emoji
    roboto
    nerd-fonts.fira-code
    nerd-fonts.iosevka
    nerd-fonts.jetbrains-mono
  ];
  nixpkgs.config.allowUnfree = true;
  security.pam.services.swaylock.text = "auth include login ";
  programs.zsh.enable = true;
  programs.dconf.enable = true;
     programs.nix-ld.enable = true;
   programs.nix-ld.libraries = with pkgs; [
     SDL
     SDL2
     SDL2_image
     SDL2_mixer
     SDL2_ttf
     SDL_image
     SDL_mixer
     SDL_ttf
     alsa-lib
     at-spi2-atk
     at-spi2-core
     atk
     bzip2
     cairo
     cups
     curlWithGnuTls
     dbus
     dbus-glib
     desktop-file-utils
     e2fsprogs
     expat
     flac
     fontconfig
     freeglut
     freetype
     fribidi
     fuse
     fuse3
     gdk-pixbuf
     glew110
     glib
     gmp
     gst_all_1.gst-plugins-base
     gst_all_1.gst-plugins-ugly
     gst_all_1.gstreamer
     gtk2
     harfbuzz
     icu
     keyutils.lib
     libGL
     libGLU
     libappindicator-gtk2
     libcaca
     libcanberra
     libcap
     libclang.lib
     libdbusmenu
     libdrm
     libgcrypt
     libgpg-error
     libidn
     libjack2
     libjpeg
     libmikmod
     libogg
     libpng12
     libpulseaudio
     librsvg
     libsamplerate
     libthai
     libtheora
     libtiff
     libudev0-shim
     libusb1
     libuuid
     libvdpau
     libvorbis
     libvpx
     libxcrypt-legacy
     libxkbcommon
     libxml2
     mesa
     nspr
     nss
     openssl
     p11-kit
     pango
     pixman
     python3
     speex
     stdenv.cc.cc
     tbb
     udev
     vulkan-loader
     wayland
     xorg.libICE
     xorg.libSM
     xorg.libX11
     xorg.libXScrnSaver
     xorg.libXcomposite
     xorg.libXcursor
     xorg.libXdamage
     xorg.libXext
     xorg.libXfixes
     xorg.libXft
     xorg.libXi
     xorg.libXinerama
     xorg.libXmu
     xorg.libXrandr
     xorg.libXrender
     xorg.libXt
     xorg.libXtst
     xorg.libXxf86vm
     xorg.libpciaccess
     xorg.libxcb
     xorg.xcbutil
     xorg.xcbutilimage
     xorg.xcbutilkeysyms
     xorg.xcbutilrenderutil
     xorg.xcbutilwm
     xorg.xkeyboardconfig
     xz
     zlib
   ];
  environment.systemPackages = with pkgs; [ git ];
  system.stateVersion = "23.11";
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nix.gc.automatic = true;
  nix.gc.dates = "weekly";
  nix.gc.options = "--delete-older-than 2d";

}
