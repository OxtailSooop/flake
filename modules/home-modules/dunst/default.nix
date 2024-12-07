{ lib, config, ...}:

let
  cfg = config.dunst;
in
{
  options.dunst.enable = lib.mkEnableOption "Enable dunst";

  config = lib.mkIf cfg.enable {
    services.dunst = {
      enable = true;
      configFile = builtins.fetchurl {
        url = "https://raw.githubusercontent.com/catppuccin/dunst/f02cd2894411c9b4caa207cfd8ed6345f97c0455/themes/mocha.conf";
        sha256 = "0a5yx88i4x8lsm3gs18kb5l71hkh266wk8hclyy48y3fi80a7dzd";
      };
    };
  };
}