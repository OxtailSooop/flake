{
  pkgs,
  ...
}:

{
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    spotify
    vesktop

    vim
    wget
    git
    btop
    obs-studio

    bemenu

    fastfetch
    nixd
  ];

  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-emoji
    jetbrains-mono
  ];

  programs = {
    thunderbird.enable = true;
    firefox.enable = true;
    zsh.enable = true;
    auto-cpufreq = {
      enable = true;
      settings = {
        charger = {
          governor = "performance";
          turbo = "auto";
        };

        battery = {
          governor = "powersave";
          turbo = "auto";
        };
      };
    };
    sway = {
      enable = true;
      wrapperFeatures.gtk = true;
    };
  };
}
