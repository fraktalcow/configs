{ config, pkgs, lib, ... }:

{
  environment.systemPackages = with pkgs; [
    tmux
    git
    gh
    tailscale
    pipewire
    pulseaudio
    ungoogled-chromium
    neovim
    openssh
    polybar
    nautilus
    oh-my-zsh
    dmenu
    dconf
    alsa-utils
    alacritty
    gcc
    mc
    rofi
    vlc
    yarn       
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
}
