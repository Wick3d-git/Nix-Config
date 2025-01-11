{
  programs.nixvim.plugins.conform-nvim = {
    enable = true;
    settings = {
      format_on_save = ''
        function(bufnr)
          -- Disable "format_on_save lsp_fallback" for lanuages that don't
          -- have a well standardized coding style. You can add additional
          -- lanuages here or re-enable it for the disabled ones.
          local disable_filetypes = { c = true, cpp = true }
          return {
            timeout_ms = 500,
            lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype]
          }
        end
      '';
      formatters_by_ft = {
        html = [["prettierd"]];
        css = [["prettierd"]];
        javascript = [["prettierd"]];
        javascriptreact = [["prettierd"]];
        typescript = [["prettierd"]];
        typescriptreact = [["prettierd"]];
        python = ["black"];
        lua = ["stylua"];
        nix = ["alejandra"];
        markdown = [["prettierd"]];
        yaml = ["yamlfmt"];
      };
    };
  };
}
