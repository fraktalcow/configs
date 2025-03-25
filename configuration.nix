{ config, pkgs, ... }:

{
  ##############################
  # Import 
  ##############################
  imports = [
    ./hardware-configuration.nix
    ./packages.nix
    ./services.nix
    ./system.nix
    ./user.nix
    ./performance.nix
    ./security.nix
    ./environment.nix
  ];

  # Define the system state version
  system.stateVersion = "24.11";
}


