{ inputs, pkgs, ... }:

let
  nixvim = inputs.nixvim;
  spicetify = inputs.spicetify;
in
{
  users.users.rollinggirl = {
    isNormalUser = true;
    description = "Rolling Girl";
    extraGroups = [ "networkmanager" "wheel" "libvirtd" ];
    shell = pkgs.zsh;
  };

  home-manager.users.rollinggirl = {
    home.username = "rollinggirl";
    home.homeDirectory = "/home/rollinggirl";

    imports = [
      ../../modules/home-modules
      nixvim.homeManagerModules.nixvim
      spicetify.homeManagerModules.default
    ];

    btop.enable = true;
    firefox.enable = true;
    git.enable = true;
    sway.enable = true;
    foot.enable = true;
    spicetify.enable = true;
    zsh.enable = true;
    nixvim.enable = true;

    programs.spicetify.theme = {
      name = "Gruvify";
      src = pkgs.fetchFromGitHub {
        owner = "Skaytacium";
        repo = "Gruvify";
        rev = "78d3de1215dded8726b195a2fce8de2a5cf1cee6";
        hash = "sha256-YgRsNOeY75IRh0qa/eKFuy1x6q7fb6lR7NkJirkFMYI=";
      };
    };

    programs.nixvim.colorschemes.gruvbox.enable = true;

    home.sessionVariables.NIXOS_OZONE_WL = "1";

    programs.home-manager.enable = true;

    home.stateVersion = "24.05";
  };
}
