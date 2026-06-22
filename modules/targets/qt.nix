{ lib, config, ... }:
{
  options.themes.targets-qt.enable = lib.mkEnableOption "QT5 and QT6 theme target";

  config = lib.mkIf (config.themes.enable && config.themes.targets-qt.enable) {
    themes.targets = {
      # qt 5
      "qt/qt.conf" = "${config.home.homeDirectory}/.config/qt5ct/qt5ct.conf";
      "qt/colors.conf" = "${config.home.homeDirectory}/.config/qt5ct/colors/current.conf";

      # KDEGlobals
      "qt/kdeglobals" = "${config.home.homeDirectory}/.config/kdeglobals";
      "qt/current.colors" = "${config.home.homeDirectory}/.local/share/color-schemes/current.colors";

      # qt 6
      "qt/colors.conf_clone_1" = "${config.home.homeDirectory}/.config/qt6ct/colors/current.conf";
      "qt/qt.conf_clone_1" = "${config.home.homeDirectory}/.config/qt6ct/qt6ct.conf";
    };
  };
}
