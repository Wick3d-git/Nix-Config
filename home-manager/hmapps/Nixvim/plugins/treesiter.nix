{
  programs.nixvim.plugins.treesitter = {
    enable = true;
    settings.ensure_installed = [
      "bash"
      "cpp"
      "css"
      "go"
      "html"
      "java"
      "json"
      "latex"
      "lua"
      "make"
      "nix"
      "python"
      "regex"
      "rust"
      "yaml"
    ];
  };
}
