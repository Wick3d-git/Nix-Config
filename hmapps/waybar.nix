{ pkgs, config, lib, ... }: {
  home.packages = with pkgs; [ ];
  programs.waybar = {
    enable = true;
    systemd = {
      enable = false;
      target = "graphical-session.target";
    };
    style = ''
                           * {
                  border: none;
                  font-family: JetBrains Mono Nerd Font, monospace;
                  font-weight: bold;
                  font-size: 14px;
                  min-height: 0;
              }

              window#waybar {
                  background-color: rgba(46, 52, 64, 0.2);
                  color: #ffffff;
              }

              tooltip {
                  background: #4c566a;
                  border-radius: 0px;
                  border-width: 2px;
                  border-style: solid;
                  border-color: #2e3440;
              }
              #tray {
          background-color: rgba(46, 52, 64, 0.2);
          padding: 0px 10px;
          margin: 5px 0px;
          margin-top: 6px;
          border: 1px solid #2e3440;
      }
              #tray {
            border-radius: 10px;
            margin-right: 10px;
            }

              #workspaces button {
                  padding: 5px;
                  color: #ffffff;
                  margin-right: 5px;
              }

              #workspaces button.active {
                  color: #ffffff;
              }

              #workspaces button.focused {
                  color: #a6adc8;
                  background: #eba0ac;
                  border-radius: 10px;
              }

              #workspaces button.urgent {
                  color: #11111b;
                  background: #a6e3a1;
                  border-radius: 10px;
              }

              #workspaces button:hover {
                  background: #2e3440;
                  color: #5E81AC;
                  border-radius: 4px;
              }
              #workspaces {
                  background-color: rgba(46, 52, 64, 0.2);
                  margin-left: 10px;
                  padding-right: 0px;
                  padding-left: 5px;
             }
              #clock {
                  color: #ffffff;
                  background-color: rgba(46, 52, 64, 0.2);
                  margin-right: 8px;
              }
    '';
    settings = [{
      "layer" = "top";
      "position" = "top";
      "mod" = "dock";
      "exclusive" = true;
      "passthrough" = false;
      "gtk-layer-shell" = true;
      "height" = 0;
      "modules-left" = [ "hyprland/workspaces" ];
      "modules-center" = [ ];
      "modules-right" = [ "tray" "clock" ];
      "hyprland/workspaces" = {
        "format" = "{name} {icon}";
        "tooltip" = false;
        "all-outputs" = true;
        "format-icons" = {
          "active" = "";
          "default" = "";
        };
        "on-scroll-up" = "hyprctl dispatch workspace e-1";
        "on-scroll-down" = "hyprctl dispatch workspace e+1";
        "on-click" = "active";
      };
      "tray" = {
        "icon-size" = 13;
        "spacing" = 10;
      };
      "clock" = {
        "format" = "{: %R  %m/%d/%Y}";
        "tooltip-format" = ''
          <big>{:%Y %B}</big>
          <tt><small>{calendar}</small></tt>'';
      };
    }];
  };
}
