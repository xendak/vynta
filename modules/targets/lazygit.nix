{ lib, config, ... }:
{
  options.themes.targets-lazygit.enable = lib.mkEnableOption "lazygit theme target";

  config = lib.mkIf (config.themes.enable && config.themes.targets-lazygit.enable) {
    themes.targets."lazygit/config.yml" = "${config.home.homeDirectory}/.config/lazygit/config.yml";
  };
}
