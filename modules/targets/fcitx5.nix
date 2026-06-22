{ lib, config, ... }:
{
  options.themes.targets-fcitx5.enable = lib.mkEnableOption "fcitx5 theme target";

  config = lib.mkIf (config.themes.enable && config.themes.targets-fcitx5.enable) {
    themes.targets = {
      # fcitx5 3
      "fcitx5/theme.conf" = "${config.home.homeDirectory}/.local/share/fcitx5/themes/current/theme.conf";
      "fcitx5/highlight.svg" =
        "${config.home.homeDirectory}/.local/share/fcitx5/themes/current/highlight.svg";
      "fcitx5/panel.svg" = "${config.home.homeDirectory}/.local/share/fcitx5/themes/current/panel.svg";
    };
  };
}
