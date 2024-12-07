{ lib, config, ... }:

let
  cfg = config.nixvim;
in
{
  options.nixvim.enable = lib.mkEnableOption "Enable nixvim";

  config = lib.mkIf cfg.enable {
    programs.nixvim = {
      enable = true;
      imports = [
        ./plugins/oil.nix
        ./plugins/lsp.nix
        ./plugins/telescope.nix
        ./plugins/cmp-nvim-lsp.nix
        ./plugins/cmp.nix
        ./plugins/web-devicons.nix
        ./plugins/lightline.nix
				./plugins/nvim-autopairs.nix
      ];
      globals.mapleader = " ";
      opts = {
        autoindent = true;
        cursorline = true;
        number = true;
        relativenumber = true;
        wrap = false;
				shiftwidth = 2;
        tabstop = 2;
      };
      keymaps = [
        {
          action = "<cmd>Telescope find_files<CR>";
          key = "<leader>ff";
        }
      ];
    };
	};
}
