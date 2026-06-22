{
  description = "Vynta, palette-driven dynamic theming";

  inputs.nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

  outputs =
    { self, nixpkgs }:
    let
      systems = [
        "x86_64-linux"
        "aarch64-linux"
        "aarch64-darwin"
      ];
      forAllSystems = nixpkgs.lib.genAttrs systems;
    in
    {
      lib = import ./lib { inherit (nixpkgs) lib; };

      builtinPalettes = import ./palettes { inherit (nixpkgs) lib; };
      builtinTemplates = import ./templates { inherit (nixpkgs) lib; };

      homeManagerModules =
        let
          targetNames = builtins.attrNames (builtins.readDir ./modules/targets);
          nixTargets = builtins.filter (f: nixpkgs.lib.hasSuffix ".nix" f && f != "default.nix") targetNames;
          targetModules = builtins.listToAttrs (
            map (f: {
              name = nixpkgs.lib.removeSuffix ".nix" f;
              value = import ./modules/targets/${f};
            }) nixTargets
          );
        in
        targetModules
        // {
          default = import ./modules/home-manager.nix self;
          targets = import ./modules/targets;
        };

      # nix run .#switch -- <theme>
      # TODO(xendak)
      apps = forAllSystems (
        system:
        let
          pkgs = nixpkgs.legacyPackages.${system};
          switchScript = pkgs.writeShellApplication {
            name = "nix-theme-switch";
            runtimeInputs = with pkgs; [
              jq
              vivid
              nodejs
              coreutils
              gnused
            ];
            text = ''
              echo "nix-theme-switch: not yet implemented"
              echo "theme: ''${1:-none}"
            '';
          };
        in
        {
          switch = {
            type = "app";
            program = "${switchScript}/bin/nix-theme-switch";
          };
        }
      );

      packages = forAllSystems (
        system:
        let
          pkgs = nixpkgs.legacyPackages.${system};
          lib = nixpkgs.lib;

          generatedThemes = lib.mapAttrs (
            paletteName: paletteData:
            lib.foldl' lib.recursiveUpdate { } (
              lib.mapAttrsToList (
                _templateName: templateFunc:
                templateFunc {
                  inherit lib pkgs;
                  config = {
                    home.username = "user";
                    xdg.configHome = "/home/user/.config";
                    fontProfiles = {
                      regular.family = "Sans";
                      monospace.family = "Monospace";
                    };
                    gtk = {
                      theme.name = "adw-gtk3";
                      iconTheme = {
                        name = "Papirus";
                        package = pkgs.papirus-icon-theme;
                      };
                      cursorTheme = {
                        name = "Adwaita";
                        size = 24;
                      };
                    };
                    monitors = [
                      {
                        height = 1080;
                        width = 1920;
                      }
                    ];
                  };
                  paletteSet = paletteData;
                }
              ) self.builtinTemplates
            )
          ) self.builtinPalettes;

        in
        {
          generatedThemes = pkgs.runCommand "generated-themes" { } ''
            mkdir -p $out
            ${lib.concatStringsSep "\n" (
              lib.mapAttrsToList (
                themeName: themeFiles:
                lib.concatStringsSep "\n" (
                  lib.mapAttrsToList (
                    filePath: fileContent:
                    let
                      fullPath = "$out/${themeName}/${filePath}";
                    in
                    ''
                      mkdir -p "$(dirname "${fullPath}")"
                      echo -n ${lib.escapeShellArg fileContent} > "${fullPath}"
                    ''
                  ) themeFiles
                )
              ) generatedThemes
            )}
          '';
        }
      );
      devShells = forAllSystems (
        system:
        let
          pkgs = nixpkgs.legacyPackages.${system};
        in
        {
          default = pkgs.mkShell {
            packages = with pkgs; [
              jq
              vivid
              nodejs
              coreutils
              gnused
            ];
            shellHook = ''
              echo "nix-theme dev shell"
              echo "palettes: $(ls ${self}/palettes/*.nix 2>/dev/null | wc -l) found"
            '';
          };
        }
      );
    };
}
