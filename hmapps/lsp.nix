{
  programs.nixvim.plugins = {
    lsp = {
      enable = true;
      servers = {
        cmake.enable = true;
        #ccls.enable = true;
        clangd.enable = true;
        gopls.enable = true;
        bashls.enable = true;
        pylsp.enable = true;
        pyright.enable = true;
        tsserver.enable = true;
        terraformls.enable = true;
        rust-analyzer.enable = true;
        rust-analyzer.installCargo = false;
        rust-analyzer.installRustc = false;
        nil_ls.enable = true;
        rust-analyzer.settings = {
          interpret.tests = true; # test this
          completion.fullFunctionSignatures.enable = true;
          lens = {
            implementations.enable = true;
            references = {
              method.enable = true;
              adt.enable = true;
              trait.enable = true;
              enumVariant.enable = true;
            };
          };
        };
        lua-ls.enable = true;
        html.enable = true;
      };
      keymaps.lspBuf = {
        "gd" = "definition";
        "gD" = "references";
        "gt" = "type_definition";
        "gi" = "implementation";
        "K" = {
          action = "hover";
          desc = "Hover";
        };
      };
    };
    none-ls = {
      enable = true;
      sources = {
        diagnostics = { golangci_lint.enable = true; };
        formatting = {
          black.enable = true;
          prettier.enable = true;
          prettier.disableTsServerFormatter = true;
          nixfmt.enable = true;

        };
      };
    };
    #lsp-lines = {
    #  enable = true;
    #};
    lsp-format.enable = true;
    # lspkind.enable = true;
    #   lspkind.cmp.enable = true;
    lspsaga = {
      enable = true;
      lightbulb.enable = true;
      codeAction.extendGitSigns = true;
      codeAction.onlyInCursor = true;
      implement.enable = true;
      implement.virtualText = true;
    };
  };
}
