{ pkgs, config, lib, ... }: {
  home.packages = with pkgs; [ ];
  programs.kitty = {
    enable = true;
    theme = "Nord";
    shellIntegration.enableZshIntegration = true;
    font.name = "JetBrainsMono Nerd Font";
    font.size = 12;
    keybindings = { "ctrl + l" = "clear_terminal scroll active"; };
    extraConfig = ''
      background_opacity .75
      confirm_os_window_close 0
      cursor_shape underline
      cursor_blink_interval .75
      cursor_underline_thickness 1.2
      enable_audio_bell no 
    '';
  };
}
