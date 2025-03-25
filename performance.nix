{ config, pkgs, ... }:

{
  powerManagement.enable = true;
  powerManagement.cpuFreqGovernor = "performance";
  powerManagement.powertop.enable = true;
  services.thermald.enable = true;

  # Memory optimizations
  swapDevices = [{ device = "/swapfile"; size = 4096; }];
  zramSwap = {
    enable = true;
    algorithm = "zstd";
    memoryPercent = 100;
    priority = 100;
  };

  # Kernel tweaks
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
}
