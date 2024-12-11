{
  plugins.lsp = {
    enable = true;
		inlayHints = true;
		servers = {
      nixd.enable = true;
      rust_analyzer.enable = true;
			clangd.enable = true;
		};
  };
}
