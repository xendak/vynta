{ lib, config, ... }:
{
  options.themes.targets-nvim.enable = lib.mkEnableOption "nvim theme target";

  config = lib.mkIf (config.themes.enable && config.themes.targets-nvim.enable) {
    themes.targets."nvim/colors.vim" = "${config.home.homeDirectory}/.config/nvim/colors.vim";
  };
}
