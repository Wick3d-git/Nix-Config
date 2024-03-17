{
  programs.wlogout = {
    enable = true;
    layout = [
      {
        "label" = "lock";
        "action" = "swaylock -i /home/wick3d/Downloads/bg1.png";
        "text" = "Lock";
        "keybind" = "l";
      }
      {
        "label" = "reboot";
        "action" = "systemctl reboot";
        "text" = "Reboot";
        "keybind" = "r";
      }
      {
        "label" = "shutdown";
        "action" = "systemctl poweroff";
        "text" = "Shutdown";
        "keybind" = "s";
      }
      {
        "label" = "logout";
        "action" = "hyprctl dispatch exit 0";
        "text" = "Logout";
        "keybind" = "e";
      }
      {
        "label" = "suspend";
        "action" = "systemctl suspend";
        "text" = "Suspend";
        "keybind" = "u";
      }
    ];
    style = ''
          
          window {
          font-family: JetBrains Mono Nerd Font;
          font-size: 14pt;
          color: #ffffff; /* text */
          background-color: rgba(46, 52, 64, 0.8);
      }

      button {
          background-repeat: no-repeat;
          background-position: center;
          background-size: 25%;
          border: none;
          background-color: rgba(30, 30, 46, 0);
          margin: 5px;
          color: #ffffff;
          transition: box-shadow 0.2s ease-in-out, background-color 0.2s ease-in-out;
      }

      button:hover {
          background-color: rgba(76, 85, 106, 0.4);
      }

      button:focus {
          background-color: #4c566a;
          color: #ffffff;
      }

      #lock {
          background-image: image(url("/home/wick3d/nix-config/Images/lock.png"));
      }
      #lock:focus {
          background-image: image(url("/home/wick3d/nix-config/Images/lock-hover.png"));
      }

      #logout {
          background-image: image(url("/home/wick3d/nix-config/Images/logout.png"));
      }
      #logout:focus {
          background-image: image(url("/home/wick3d/nix-config/Images/logout-hover.png"));
      }

      #suspend {
          background-image: image(url("/home/wick3d/nix-config/Images/sleep.png"));
      }
      #suspend:focus {
          background-image: image(url("/home/wick3d/nix-config/Images/sleep-hover.png"));
      }

      #shutdown {
          background-image: image(url("/home/wick3d/nix-config/Images/power.png"));
      }
      #shutdown:focus {
          background-image: image(url("/home/wick3d/nix-config/Images/power-hover.png"));
      }

      #reboot {
          background-image: image(url("/home/wick3d/nix-config/Images/restart.png"));
      }
      #reboot:focus {
          background-image: image(url("/home/wick3d/nix-config/Images/restart-hover.png"));
      }
    '';
  };
}
