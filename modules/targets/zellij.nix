{ lib, config, ... }:
{
  options.themes.targets-zellij.enable = lib.mkEnableOption "zellij theme target";

  config = lib.mkIf (config.themes.enable && config.themes.targets-zellij.enable) {
    themes.targets."zellij/default.kdl" =
      "${config.home.homeDirectory}/.config/zellij/themes/default.kdl";
  };
}
