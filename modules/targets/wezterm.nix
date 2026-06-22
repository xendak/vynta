{ lib, config, ... }:
{
  options.themes.targets-wezterm.enable = lib.mkEnableOption "wezterm theme target";

  config = lib.mkIf (config.themes.enable && config.themes.targets-wezterm.enable) {
    themes.targets."wezterm/colors/current.lua" =
      "${config.home.homeDirectory}/.config/wezterm/colors/current.lua";
  };
}
