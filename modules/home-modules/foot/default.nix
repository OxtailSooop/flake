{ lib, config, ...}:

let
  cfg = config.foot;
in
{
  options.foot.enable = lib.mkEnableOption "Enable foot";

  config = lib.mkIf cfg.enable {
    programs.foot = {
      enable = true;
      settings = {
        main = {
          font = "JetBrains Mono:size=10";
        };
      };
    };
  };
}
