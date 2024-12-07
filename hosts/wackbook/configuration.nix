## Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{
  inputs,
  ...
}:

let
  auto-cpufreq = inputs.auto-cpufreq;
  nur = inputs.nur;
in
{
  imports = [
    ../common
    ../../profiles/rollinggirl
    ../../modules/nixos/home-manager
    # nur.nixosModules.nur # idk
    auto-cpufreq.nixosModules.default
  ];

  nixpkgs.overlays = [
    nur.overlay
  ];

  boot = {
    loader.systemd-boot.enable = true;
    loader.efi.canTouchEfiVariables = true;
    #kernelPackages = pkgs.linuxPackages_latest;
  };

  networking = {
    hostName = "wackbook";
    #wireless.enable = true;  # Enables wireless support via wpa_supplicant.
    networkmanager.enable = true;
  };

  swapDevices = [
    { device = "/var/lib/swapfile";
      size = 16 * 1024;
    }
  ];

  systemd.extraConfig = "DefaultLimitNOFILE=2048";

  security.rtkit.enable = true; # audio smthn smthn

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment? yes
}