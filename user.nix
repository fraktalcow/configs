{ config, pkgs, ... }:

{
  users.users.fraktal = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "audio" "realtime" "video" ];
    shell = pkgs.zsh;
  };
  nixpkgs.config.allowUnfree = true;
}
