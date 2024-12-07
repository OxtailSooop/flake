{ lib, config, ... }:

let
  cfg = config.btop;
in
{
  options.btop.enable = lib.mkEnableOption "Enable btop";

  config = lib.mkIf cfg.enable {
    programs.btop = {
      enable = true;
      settings = {
        theme_background = false;
      };
    };
  };
}
