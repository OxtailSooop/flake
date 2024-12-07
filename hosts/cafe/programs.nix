{
  pkgs,
  inputs,
  ...
}:

let
  hyprpkgs = inputs.hyprland.packages.${pkgs.system};
  swwwpkg = inputs.swww.packages.${pkgs.system}.swww;
in
{
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    vlc
    spotify
    vesktop
    tor-browser-bundle-bin

		libreoffice
    vim
    wget
    git
    vscode
    btop
    obs-studio
    openrgb

    #catppuccin-gtk
    catppuccin-cursors.mochaLavender

    lunar-client

    anki
    alacritty
    kitty
    wofi
    swwwpkg
    hyprpolkitagent
    dunst
    hyprshot
    playerctl

    fastfetch
    #cava # broken?????
    cbonsai
    pipes
    cloc
    nixd
  ];

  environment.plasma6.excludePackages = with pkgs.kdePackages; [
    discover
    khelpcenter
    elisa
    kinfocenter
    # kwrite # ???????????
    okular
  ];

  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-emoji
    jetbrains-mono
  ];

  # cachix for hyprland
  nix.settings = {
    substituters = ["https://hyprland.cachix.org"];
    trusted-public-keys = ["hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="];
  };

  programs = {
    thunderbird.enable = true;
    firefox.enable = true;
    zsh.enable = true;
    virt-manager.enable = true;
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
    hyprland = {
      enable = true;
      package = hyprpkgs.hyprland;
      portalPackage = hyprpkgs.xdg-desktop-portal-hyprland;
    };
  };
}
