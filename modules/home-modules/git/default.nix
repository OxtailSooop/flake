{ lib, config, ...}:

let
  cfg = config.git;
in
{
  options.git.enable = lib.mkEnableOption "Enable git";

  config = lib.mkIf cfg.enable {
    programs.git = {
      enable = true;
      extraConfig.init.defaultBranch = "main";
    };    
  };
}
