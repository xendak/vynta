{ lib, config, ... }:
{
  options.themes.targets-obsidian = {
    enable = lib.mkEnableOption "obsidian theme target";
    vaultDir = lib.mkOption {
      type = lib.types.str;
      default = "${config.home.homeDirectory}/Documents/Notes/${config.home.username}/.obsidian";
      description = "Path to your obsidian vault directory.";
    };
  };

  config = lib.mkIf (config.themes.enable && config.themes.targets-obsidian.enable) {
    themes.targets = {
      "obsidian/theme.css" = "${config.themes.targets-obsidian.vaultDir}/snippets/material-theme.css";
      "obsidian/shiki.json" = "${config.themes.targets-obsidian.vaultDir}/themes/shiki.json";
    };
  };
}
