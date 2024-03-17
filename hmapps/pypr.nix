{
  home.file.".config/hypr/pyprland.json".text = ''
    {
      "pyprland": {
        "plugins": ["scratchpads", "magnify"]
      },
      "scratchpads": {
        "term": {
          "command": "kitty --class scratchpad",
          "margin": 50,
          "animation": "fromTop"
        },
        "ranger": {
          "command": "kitty --class scratchpad -e ranger",
          "margin": 50,
          "animation": "fromTop"
        }
      }
    }
  '';
}
