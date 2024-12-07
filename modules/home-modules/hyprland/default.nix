{
  inputs,
  lib,
  config,
  pkgs,
  ...
}:

let
  hypr-pkg = inputs.hyprland.packages.${pkgs.system}.hyprland;
  cfg = config.hyprland;
in
{
  options.hyprland.enable = lib.mkEnableOption "Enable hyprland";

  config = lib.mkIf cfg.enable {

    # cursor is cut off in wayland apps
    wayland.windowManager.hyprland = {
      enable = true;
      xwayland.enable = true;
      settings = {
        "$mainMod" = "SUPER";
        monitor = [
          "desc:HP Inc. HP X27q 6CM1380CHS,2560x1440@120,0x0,1"
          "eDP-1,disable"
        ];

        "$terminal" = "kitty";
        "$menu" = "wofi --show drun";
        "$cursor" = "catppuccin-mocha-lavender-cursors";

        exec-once = [
          "systemctl --user start hyprpolkitagent"
          "systemctl --user start dunst"
          "swww-daemon"
          "dconf write /org/gnome/desktop/interface/cursor-theme \"\'$cursor\'\""
          "dconf write /org/gnome/desktop/interface/color-scheme \"\'prefer-dark\'\""
          "dconf write /org/gnome/desktop/interface/gtk-theme \"\'Dark-adwaita\'\""
        ];

        exec-shutdown = [
          "systemctl --user stop hyprpolkitagent"
          "systemctl --user stop dunst"
          "swww kill"
        ];

        env = [
          "XCURSOR_SIZE,24"
          "XCURSOR_THEME,$cursor"
          "HYPRCURSOR_SIZE,24"
          "HYPRCURSOR_THEME,$cursor"
          "GTK_THEME,Adwaita-dark"
        ];

        general = {
          gaps_in = 5;
          gaps_out = 20;

          border_size = 1;

          "col.active_border" = "rgba(00000000)";
          "col.inactive_border" = "rgba(00000000)";
        };

        decoration = {
          rounding = 10;
          blur = {
            enabled = false;
          };
          shadow = {
            enabled = false;
          };
        };

        animations = {
          enabled = true;
          bezier = [
            "easeOutQuint,0.23,1,0.32,1"
            "easeInOutCubic,0.65,0.05,0.36,1"
            "linear,0,0,1,1"
            "almostLinear,0.5,0.5,0.75,1.0"
            "quick,0.15,0,0.1,1"
          ];

          animation = [
            "global,1,10,default"
            "border,1,5.39,easeOutQuint"
            "windows,1,4.79,easeOutQuint"
            "windowsIn,1,4.1,easeOutQuint,popin 87%"
            "windowsOut,1,1.49,linear,popin 87%"
            "fadeIn,1,1.73,almostLinear"
            "fadeOut,1,1.46,almostLinear"
            "fade,1,3.03,quick"
            "layers,1,3.81,easeOutQuint"
            "layersIn,1,4,easeOutQuint,fade"
            "layersOut,1,1.5,linear,fade"
            "fadeLayersIn,1,1.79,almostLinear"
            "fadeLayersOut,1,1.39,almostLinear"
            "workspaces,1,1.94,almostLinear,fade"
            "workspacesIn,1,1.21,almostLinear,fade"
            "workspacesOut,1,1.94,almostLinear,fade"
          ];
        };

        bindl = (import ./binds.nix).bindl;
        bindel = (import ./binds.nix).bindel;
        bindm = (import ./binds.nix).bindm;
        bind = (import ./binds.nix).bind;

        workspace = [
          "1,monitor:HDMI-A-1"
        ];

        dwindle = {
          pseudotile = true;
          preserve_split = true;
        };

        master = {
          new_status = "master";
        };

        misc = {
          force_default_wallpaper = 1;
          disable_hyprland_logo = true;
        };

        input = {
          kb_layout = "gb";
        };

        windowrulev2 = [
          "suppressevent maximize,class:.*" # Ignore maximise requests
          "nofocus,class:^$,title:^$,xwayland:1,floating:1,fullscreen:0,pinned:0" # Fix some dragging issues with xwayland
        ];
      };

      plugins = [
        # hypr-plugs.hyprexpo
      ];
      package = hypr-pkg;
    };

    #fetch url only returns the file path
    # home.file.".config/hyprland/colours.conf".text = builtins.fetchurl {
    #   url = "https://raw.githubusercontent.com/catppuccin/hyprland/b57375545f5da1f7790341905d1049b1873a8bb3/themes/mocha.conf";
    #   sha256 = "0513j8wbh50jah2r0h48sw9jfw8w0h6w8z90vg0f6zk3jsyls5ab";
    # };
  };
}
