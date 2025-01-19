{ pkgs, ... }:

{
  services = {
		printing.enable = false;
    #hardware.openrgb.enable = true;
    fstrim.enable = true;
    fwupd.enable = true;
    avahi = {
      enable = true;
      nssmdns4 = true;
    };
    xserver.xkb = {
      layout = "gb";
      variant = "";
    };
    pipewire = {
      enable = true;
      alsa.enable = true;
      pulse.enable = true;
    };

    displayManager.sddm.enable = true;
    displayManager.sddm.wayland.enable = true;
    desktopManager.plasma6.enable = true;
    power-profiles-daemon.enable = false; # let auto-cpufreq do its thing
  };
}
