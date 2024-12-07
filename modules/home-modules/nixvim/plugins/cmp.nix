{
  plugins.cmp = {
    enable = true;
    settings = {
			experimental = {
				ghost_text = true;
			};
			mapping = {
				"<Down>" = "cmp.mapping(cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }), {'i', 's'})";
				"<Up>" = "cmp.mapping(cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }), {'i', 's'})";
				"<Esc>" = "cmp.mapping.abort()";
				"<C-Up>" = "cmp.mapping.scroll_docs(-1)";
				"<C-Down>" = "cmp.mapping.scroll_docs(1)";
				"<C-Space>" = "cmp.mapping.complete()";
				"<CR>" = "cmp.mapping.confirm({ select = true })";
			};
      autoEnableSources = true;
      sources = [
        { name = "nvim_lsp"; }
      ];
    };
  };
}
