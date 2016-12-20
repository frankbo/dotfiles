{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  boot.loader.grub.enable = true;
  boot.loader.grub.version = 2;

  # Load luks desciption
  boot.initrd.luks.devices = [
    {
      name = "root";
      device = "/dev/sda2";
      preLVM = true;
    }
  ];

  boot.loader.grub.device = "/dev/sda";

  networking.hostName = "nixos"; # Define your hostname.
  networking.networkmanager.enable = true;  

  hardware.pulseaudio.enable = true;

  powerManagement.enable = true;

  nixpkgs.config.allowUnfree = true;

  # Select internationalisation properties.
  i18n = {
    consoleFont = "lat9w-16";
    consoleKeyMap = "de";
    defaultLocale = "de_DE.UTF-8";
  };

   # Configure fonts
  fonts = {
    enableCoreFonts = true;
    enableFontDir = true;
    enableGhostscriptFonts = true;
    fonts = with pkgs; [
      anonymousPro
      corefonts
      dejavu_fonts
      freefont_ttf
      liberation_ttf
      source-code-pro
      terminus_font
      ttf_bitstream_vera
      ubuntu_font_family
    ];
  };
  
  users.extraUsers.frank = {
    name = "frank";
    group = "users";
    extraGroups = [
      "wheel" "disk" "audio" "video" "networkmanager" "systemd-journal"
    ];
    createHome = true;
    uid = 1000;
    home = "/home/frank";
    shell = "/run/current-system/sw/bin/zsh";
  };


  # Set your time zone.
  time.timeZone = "Europe/Berlin";

  # Enable the X11 windowing system.
  # services.xserver.xkbOptions = "eurosign:e";
  services.nixosManual.showManual = true;
  services.acpid.enable = true;
  services.dbus.enable = true;
  services.logind.extraConfig = "HandleLidSwitch=suspend";
  services.xserver = {
    enable = true;
    layout = "de";
    windowManager.i3.enable = true;
    windowManager.default = "i3";
   
    desktopManager.xterm.enable = false;
    desktopManager.default = "none";
 
    displayManager = {
      slim.enable = true;
      slim.defaultUser = "frank";
    };

    synaptics = {
      enable = true;
      twoFingerScroll = true;
    };
  };

  environment.systemPackages = with pkgs; [ 
    i3
    i3status
    i3lock-fancy
    # For i3 background
    feh  
    # Energy savings for laptops
    acpi
    # Search menu in top bar (mod + d)
    # dmenu
    rofi
    # Control audio
    playerctl
    tmux
    vim
    wget
    oh-my-zsh
    # nmtui cli wifi manager
    # Ranger cli file manager
    ranger 
    # Alpine cli mail client
    alpine
    which
    # Alternative terminal
    terminator
    htop
    unzip
    chromium
    spotify
    git
  ];

  programs.zsh.enable = true; 

  # The NixOS release to be compatible with for stateful data such as databases.
  system.stateVersion = "16.03";

}
