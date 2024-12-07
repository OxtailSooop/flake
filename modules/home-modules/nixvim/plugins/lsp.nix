{
  plugins.lsp = {
    enable = true;
	 #diagnostics = {
	 #	refreshSupport = false;
	 #};
		servers = {
      nixd.enable = true;
      rust_analyzer.enable = true;
			clangd.enable = true;
		};
  };
}
