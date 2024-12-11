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
				./plugins/noice.nix
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
				cmdheight = 0;
			};
      keymaps = [
        {
          action = "<cmd>Telescope find_files<CR>";
          key = "<leader>ff";
        }
        {
					action = "<cmd>lua vim.lsp.buf.code_action()<CR>";
					key = "<leader>ca";
				}
				{
					action = "<cmd>lua vim.diagnostic.open_float(0, {scope=\"line\"})<CR>";
					key = "<leader>d";
				}
      ];
			diagnostics.virtual_text = false;
			extraConfigLuaPost = ''
			for _, method in ipairs({ 'textDocument/diagnostic', 'workspace/diagnostic' }) do
					local default_diagnostic_handler = vim.lsp.handlers[method]
					vim.lsp.handlers[method] = function(err, result, context, config)
							if err ~= nil and err.code == -32802 then
									return
							end
							return default_diagnostic_handler(err, result, context, config)
					end
			end
			'';
		};
	};
}
