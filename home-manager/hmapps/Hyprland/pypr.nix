{
  home.file.".config/hypr/pyprland.json".text = ''
    {
      "pyprland": {
        "plugins": ["scratchpads", "magnify"]
      },
      "scratchpads": {
        "term": {
          "command": "ghostty --class=scratchpad.foo",
          "margin": 50,
          "animation": "fromTop"
        },
        "ranger": {
          "command": "ghostty --class=scratchpad.foo -e yazi",
          "margin": 50,
          "animation": "fromTop"
        },
        "volume": {
          "command": "ghostty --class=scratchpad.foo -e pulsemixer",
          "margin": 50,
          "animation": "fromTop"
        }
      }
    }
  '';
}
