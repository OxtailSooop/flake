{ inputs, pkgs, ... }:

let
  nixvim = inputs.nixvim;
  spicetify = inputs.spicetify;
  spicePkgs = inputs.spicetify.legacyPackages.${pkgs.system};
in
{
  users.users.cat = {
    isNormalUser = true;
    description = "Cat";
    extraGroups = [ "networkmanager" "wheel" "libvirtd" ];
    shell = pkgs.zsh;
  };

  home-manager.users.cat = {
    home.username = "cat";
    home.homeDirectory = "/home/cat";

    imports = [
      ../../modules/home-modules
      nixvim.homeManagerModules.nixvim
      spicetify.homeManagerModules.default
    ];

    btop.enable = true;
    # dunst.enable = true;
    firefox.enable = true;
    git.enable = true;
    # hyprland.enable = true;
    kitty.enable = true;
    # foot.enable = true;
    spicetify.enable = true;
    zsh.enable = true;
    nixvim.enable = true;

    programs.spicetify.theme = spicePkgs.themes.catppuccin;
    programs.spicetify.colorScheme = "mocha";

    programs.kitty.themeFile = "Catppuccin-Mocha";

    programs.nixvim.colorschemes.catppuccin = {
      enable = true;
      settings = {
        flavour = "mocha";
        transparent_background = true;
      	integrations = {
        	cmp = true;
				};
			};
		};

    home.sessionVariables.NIXOS_OZONE_WL = "1";

    programs.home-manager.enable = true;

    home.stateVersion = "24.05";
  };
}
