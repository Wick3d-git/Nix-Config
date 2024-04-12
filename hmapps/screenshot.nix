{
  home.file.".config/hypr/screenshot.sh".text = ''
  #!/bin/sh
  SAVEDIR="$HOME/Pictures/Screenshots"
  mkdir -p -- "SAVEDIR"
  FILENAME="$SAVEDIR/$(date '+%Y-%m-%d_%H-%M-%S').png"
  grim -g "$(slurp)" "$FILENAME"  
  swappy -f "$FILENAME" -o "$FILENAME"
  notify-send "Screenshot saved to $FILENAME"
  '';
  home.file.".config/hypr/screenshot.sh".executable = true;
}
