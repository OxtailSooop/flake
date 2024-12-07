{ lib, config, ...}:

let
  cfg = config.kitty;
in
{
  options.kitty.enable = lib.mkEnableOption "Enable kitty";

  config = lib.mkIf cfg.enable {
    programs.kitty = {
      enable = true;
      settings = {
        font_family = "JetBrains Mono";
        enable_audio_bell = false;
        window_padding_width = 16;
        font_size = 14;
        background_opacity = 0.9;
      };
    };
  };
}
