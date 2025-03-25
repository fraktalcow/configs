{ config, pkgs, ... }:

{
  ##############################
  # Import Hardware Settings
  ##############################
  imports = [ ./hardware-configuration.nix ];

  ##############################
  # Boot and UEFI Configuration
  ##############################
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  nix.settings.experimental-features = ["nix-command" "flakes"];
  ##############################
  # Networking
  ##############################
  networking.hostName = "nixos";
  networking.networkmanager.enable = true;

  ##############################
  # Time Zone and Locale Settings
  ##############################
  time.timeZone = "Asia/Kolkata";
  i18n.defaultLocale = "en_IN";
  i18n.extraLocaleSettings = {
    LC_ALL = "en_IN";
  };

  ##############################
  # X Server and Window Manager
  ##############################
  services.xserver.enable = true;
  services.xserver.displayManager.lightdm.enable = true;
  services.xserver.windowManager.i3.enable = true;

  # Keyboard Layout
  services.xserver.xkb.layout = "us";

  # Auto-login
  services.displayManager.autoLogin.enable = true;
  services.displayManager.autoLogin.user = "fraktal";

  ##############################
  # Power Management & Performance
  ##############################
  powerManagement.enable = true;
  powerManagement.cpuFreqGovernor = "performance";
  powerManagement.powertop.enable = true;
  services.thermald.enable = true;

  ##############################
  # Audio Configuration (PipeWire)
  ##############################
  hardware.pulseaudio.enable = false;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };
  security.rtkit.enable = true;

  ##############################
  # Essential Services
  ##############################
  services.openssh.enable = true;
  services.flatpak.enable = true;
  xdg.portal.enable = true;
  xdg.portal.extraPortals = with pkgs; [ xdg-desktop-portal-gtk ];

  ##############################
  # Memory, Swap, and ZRAM Optimizations
  ##############################
  swapDevices = [{ device = "/swapfile"; size = 4096; }];
  zramSwap = {
    enable = true;
    algorithm = "zstd";
    memoryPercent = 100;
    priority = 100;
  };

  ##############################
  # Kernel Parameters & Sysctl Tweaks
  ##############################
  boot.kernelParams = [
    "threadirqs"
    "intel_idle.max_cstate=1"
    "pcie_aspm=off"
    "i915.enable_fbc=1"
    "i915.enable_psr=1"
  ];
  boot.kernel.sysctl = {
    "vm.swappiness" = 10;
    "vm.vfs_cache_pressure" = 50;
    "kernel.sched_autogroup_enabled" = 1;
  };

  ##############################
  # Graphics Acceleration (Intel GPU)
  ##############################
  hardware.graphics.enable = true;
  hardware.graphics.extraPackages = with pkgs; [
    intel-media-driver
    vaapiIntel
    vaapiVdpau
    libvdpau-va-gl
    intel-compute-runtime
  ];

  ##############################
  # System Maintenance & Auto-Upgrades
  ##############################
  system.autoUpgrade = {
    enable = true;
    allowReboot = false;
    dates = "03:00";
    randomizedDelaySec = "45min";
  };

  ##############################
  # Security: sudo configuration
  ##############################
  security.sudo = {
    enable = true;
    wheelNeedsPassword = false;
  };

  ##############################
  # User & Permissions
  ##############################
  users.users.fraktal = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "audio" "realtime" "video" ];
    shell = pkgs.zsh;
  };
  nixpkgs.config.allowUnfree = true;


  ##############################
  # Terminal & Editor Configuration
  ##############################
  programs.zsh = {
    enable = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;
    ohMyZsh = {
      enable = true;
      plugins = [ "git" "sudo" "history" "copypath" "dirhistory" ];
      theme = "robbyrussell";
    };
    histSize = 10000;
  };
  programs.tmux.enable = true;

  xdg.mime.defaultApplications = {
    "text/plain" = "gnome-text-editor.desktop";
  };

  ##############################
  # Essential Packages & Development Tools
  ##############################
  environment.systemPackages = with pkgs; [
    tmux
    gnome-text-editor
    (python312.withPackages (ps: with ps; [ pip ]))
    nodejs_20
    nodePackages.npm
    nodePackages.typescript
    nodePackages.yarn
    python311
    python311Packages.pip
    python311Packages.setuptools
    catppuccin-gtk
    catppuccin-cursors
  ];
  environment.variables.XCURSOR_THEME = "catppuccin-cursors";

  ##############################
  # System State Version
  ##############################
  system.stateVersion = "24.11";
} 
