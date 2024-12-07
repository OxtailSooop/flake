{
    bind = [
      ",PRINT, exec, hyprshot -m region"
      # Move Active to Workspace
      "$mainMod SHIFT,1,movetoworkspace,1"
      "$mainMod SHIFT,2,movetoworkspace,2"
      "$mainMod SHIFT,3,movetoworkspace,3"
      "$mainMod SHIFT,4,movetoworkspace,4"
      "$mainMod SHIFT,5,movetoworkspace,5"
      "$mainMod SHIFT,6,movetoworkspace,6"
      "$mainMod SHIFT,7,movetoworkspace,7"
      "$mainMod SHIFT,8,movetoworkspace,8"
      "$mainMod SHIFT,9,movetoworkspace,9"
      "$mainMod SHIFT,0,movetoworkspace,10"

      # Switch Workspace
      "$mainMod,1,workspace,1"
      "$mainMod,2,workspace,2"
      "$mainMod,3,workspace,3"
      "$mainMod,4,workspace,4"
      "$mainMod,5,workspace,5"
      "$mainMod,6,workspace,6"
      "$mainMod,7,workspace,7"
      "$mainMod,8,workspace,8"
      "$mainMod,9,workspace,9"
      "$mainMod,0,workspace,10"

      # Switch Focus
      "$mainMod, left, movefocus, l"
      "$mainMod, right, movefocus, r"
      "$mainMod, up, movefocus, u"
      "$mainMod, down, movefocus, d"

      "$mainMod,T,exec,$terminal"
      "L_ALT,F4,killactive,"
      "$mainMod,V,togglefloating,"
      "$mainMod,SPACE,exec,$menu"
      "$mainMod,J,togglesplit,"

      # scratchpad
      "$mainMod, S, togglespecialworkspace, magic"
      "$mainMod SHIFT, S, movetoworkspace, special:magic"
    ];

    bindm = [
      "$mainMod,mouse:272,movewindow"
      "$mainMod,mouse:273,resizewindow"
    ];

    bindel = [
      # Audio Output
      ",XF86AudioRaiseVolume,exec,wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+ && dunstify $(wpctl get-volume @DEFAULT_AUDIO_SINK@)"
      ",XF86AudioLowerVolume,exec,wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%- && dunstify $(wpctl get-volume @DEFAULT_AUDIO_SINK@)"

      # Audio Input
      ",XF86AudioMute,exec,wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle && dunstify $(wpctl get-volume @DEFAULT_AUDIO_SINK@)"
      ",XF86AudioMicMute,exec,wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle && dunstify $(wpctl get-volume @DEFAULT_AUDIO_SOURCE@)"

      # Brightness
      ",XF86MonBrightnessUp,exec,brightnessctl s 10%+"
      ",XF86MonBrightnessDown,exec,brightnessctl s 10%-"
    ];

    bindl = [
      # Music Player
      ",XF86AudioNext,exec,playerctl next"
      ",XF86AudioPause,exec,playerctl play-pause"
      ",XF86AudioPlay,exec,playerctl play-pause"
      ",XF86AudioPrev,exec,playerctl previous"

      # Disable monitor on laptop when the lid is closed
      # Doesent work if the lid is already closed before login
      # nothing a simple bash script cant fix!
      # ",switch:off:Lid Switch,exec,hyprctl keyword monitor \"eDP-1, 1920x1080@60, 2560x0, 1\""
      # ",switch:on:Lid Switch,exec,hyprctl keyword monitor \"eDP-1, disable\""
    ];
}