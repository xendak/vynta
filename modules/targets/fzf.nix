{ lib, config, ... }:
{
  options.themes.targets-fzf.enable = lib.mkEnableOption "fzf theme target";

  config = lib.mkIf (config.themes.enable && config.themes.targets-fzf.enable) {
    themes.targets."fzf/colors" = "${config.home.homeDirectory}/.config/fzf/colors";
  };
}
