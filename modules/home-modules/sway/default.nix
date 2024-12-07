{ lib, config, ...}:

let
  cfg = config.sway;
in
{
  options.sway.enable = lib.mkEnableOption "Enable sway";

  config = lib.mkIf cfg.enable {
    wayland.windowManager.sway = {
      enable = true;
      xwayland = false;
      config = {
        modifier = "Mod4";
        terminal = "foot";
        menu = "bemenu-run";
      };
    };
  };
}
