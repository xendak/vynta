{ lib }:
let
  themeLib = import ../lib { inherit lib; };
  paletteFiles = builtins.attrNames (builtins.readDir ./.);
  nixFiles = lib.filter (f: lib.hasSuffix ".nix" f && f != "default.nix") paletteFiles;

  toAttrSet =
    file:
    let
      name = lib.removeSuffix ".nix" file;
      imported = import ./${file};
      rawData = if builtins.isFunction imported then imported { inherit lib; } else imported;
    in
    {
      inherit name;
      value = themeLib.processTheme rawData;
    };
in
lib.listToAttrs (map toAttrSet nixFiles)
