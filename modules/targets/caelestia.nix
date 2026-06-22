{ lib, config, ... }:
{
  options.themes.targets-caelestia.enable = lib.mkEnableOption "caelestia quickshell theme target";

  config = lib.mkIf (config.themes.enable && config.themes.targets-caelestia.enable) {
    themes.targets."caelestia/theme.txt" =
      "${config.home.homeDirectory}/.local/state/caelestia/scheme/preview.txt";
  };
}
