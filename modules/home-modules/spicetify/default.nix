{
  pkgs,
  lib,
  config,
  inputs,
  ...
}:

let
  spicePkgs = inputs.spicetify.legacyPackages.${pkgs.system};
  cfg = config.spicetify;
in
{
  options.spicetify.enable = lib.mkEnableOption "Enable spicetify";

  config = lib.mkIf cfg.enable {
    programs.spicetify = {
      enable = true;
      enabledExtensions = with spicePkgs.extensions; [
        adblock
      ];
      enabledCustomApps = [
        spicePkgs.apps.lyricsPlus
      ];
		};
  };
}
