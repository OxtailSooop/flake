{ lib, config, ...}:

let
  cfg = config.zsh;
in
{
  options.zsh.enable = lib.mkEnableOption "Enable zsh";
  
  config = lib.mkIf cfg.enable {
    programs.zsh = {
      enable = true;

      autosuggestion = {
        enable = true;
      };

      oh-my-zsh = {
        enable = true;
        # custom = "./zsh/custom/";
        theme = "half-life";
      };
    };
  };
}
