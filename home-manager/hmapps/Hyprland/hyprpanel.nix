{
  inputs,
  config,
  ...
}:
let
  dir = "${config.home.homeDirectory}";
in
{
  imports = [ inputs.hyprpanel.homeManagerModules.hyprpanel ];
  programs.hyprpanel = {
    # Enable the module.
    # Default: false
    enable = true;

    overlay.enable = true;

    # Add '/nix/store/.../hyprpanel' to your
    # Hyprland config 'exec-once'.
    # Default: false
    hyprland.enable = true;

    # Fix the overwrite issue with HyprPanel.
    # See below for more information.
    # Default: false
    overwrite.enable = true;

    # Import a theme from './themes/*.json'.
    # Default: ""
    theme = "nord_vivid";

    # Override the final config with an arbitrary set.
    # Useful for overriding colors in your selected theme.
    # Default: {}
    override = {
      theme.bar.menus.text = "#123ABC";
    };

    # Configure bar layouts for monitors.
    # See 'https://hyprpanel.com/configuration/panel.html'.
    # Default: null
    layout = {
      "bar.layouts" = {
        "0" = {
          left = [
            "dashboard"
            "workspaces"
          ];
          middle = [ "windowtitle" ];
          right = [
            "systray"
            "volume"
            "clock"
          ];
        };
        "1" = {
          left = [ ];
          middle = [ ];
          right = [ ];
        };
      };
    };

    # Configure and theme almost all options from the GUI.
    # Options that require '{}' or '[]' are not yet implemented,
    # except for the layout above.
    # See 'https://hyprpanel.com/configuration/settings.html'.
    # Default: <same as gui>
    settings = {
      bar.launcher.autoDetectIcon = true;
      bar.workspaces.show_numbered = true;
      bar.workspaces.ignored = "(-\\\\d+)";
      bar.clock.format = "%H:%M 󰃭 %m/%d/%Y";
      bar.clock.icon = "";
      menus.dashboard.shortcuts.left.shortcut1.command = "firefox";
      menus.dashboard.shortcuts.left.shortcut1.icon = "";
      menus.dashboard.shortcuts.left.shortcut1.tooltip = "Firefox";
      menus.dashboard.shortcuts.left.shortcut3.command = "webcord";
      menus.dashboard.shortcuts.left.shortcut2.command = "spotify";
      menus.dashboard.powermenu.avatar.image = "${dir}/NixOS-Config/Downloads/icon.png";
      bar.windowtitle.custom_title = true;

      menus.clock = {
        time = {
          military = true;
          hideSeconds = false;
        };
        weather.unit = "imperial";
      };

      menus.dashboard.directories.enabled = false;
      menus.dashboard.stats.enable_gpu = true;

      theme.bar.transparent = true;

      theme.font = {
        name = "JetBrainsMono Nerd Font";
        size = "16px";
      };
    };
  };
}
