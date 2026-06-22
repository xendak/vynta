{ lib, config, ... }:
{
  options.themes.targets-emacs.enable = lib.mkEnableOption "emacs theme target";

  config = lib.mkIf (config.themes.enable && config.themes.targets-emacs.enable) {
    themes.targets."emacs/themes/custom-nix-theme.el" =
      "${config.home.homeDirectory}/.config/emacs/themes/custom-nix-theme.el";
  };
}
