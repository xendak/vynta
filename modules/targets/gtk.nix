{ lib, config, ... }:
{
  options.themes.targets-gtk.enable = lib.mkEnableOption "GTK theme target";

  config = lib.mkIf (config.themes.enable && config.themes.targets-gtk.enable) {
    themes.targets = {
      # gtk 3
      "gtk/gtk.css" = "${config.home.homeDirectory}/.config/gtk-3.0/gtk.css";
      "gtk/gtk.css_clone_1" = "${config.home.homeDirectory}/.config/gtk-3.0/gtk-dark.css";
      "gtk/settings.ini" = "${config.home.homeDirectory}/.config/gtk-3.0/settings.ini";

      # gtk 4
      "gtk/gtk.css_clone_2" = "${config.home.homeDirectory}/.config/gtk-4.0/gtk.css";
      "gtk/gtk.css_clone_3" = "${config.home.homeDirectory}/.config/gtk-4.0/gtk-dark.css";
      "gtk/settings.ini_clone_1" = "${config.home.homeDirectory}/.config/gtk-4.0/settings.ini";

      # gtk 2
      "gtk/settings.ini_clone_2" = "${config.home.homeDirectory}/.config/gtk-2.0/gtkrc";
    };
  };
}
