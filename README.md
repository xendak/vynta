# vynta

Palette-driven dynamic theming for NixOS via home-manager. Define a color
palette once, generate themed config files for every app at build time, and
switch themes at runtime with a single command.

## How it works

Vynta has three layers:

- **Palettes** — color definitions based on Material Design 3 roles, with
  automatic ANSI/syntax color derivation
- **Templates** — per-app Nix functions that take a palette and produce config
  file contents
- **Targets** — mappings from generated files to their destination paths on disk

At build time, every palette is run through every template, producing a
derivation containing all themes and all their files. At runtime, `vynta`
symlinks (or writes) the chosen theme's files to their destinations.

## Installation

Add to your flake inputs:

```nix
inputs.vynta = {
  url = "github:xendak/vynta";
  inputs.nixpkgs.follows = "nixpkgs";
};
```

In your home-manager config:

```nix
{ inputs, ... }:
{
  imports = [
    inputs.vynta.homeManagerModules.default  # core module
    inputs.vynta.homeManagerModules.targets  # all per-app target modules
  ];

  themes = {
    enable = true;
    theme  = "gorgoroth";  # default theme on login
  };
}
```

## Options

| Option                 | Type    | Default                | Description                                                                 |
| ---------------------- | ------- | ---------------------- | --------------------------------------------------------------------------- |
| `enable`               | bool    | —                      | Enable vynta                                                                |
| `theme`                | string  | `"gorgoroth"`          | Default theme name                                                          |
| `wallpaper`            | string  | `""`                   | Default wallpaper path                                                      |
| `wallpaperScript`      | string  | `""`                   | A script called with `<wallpaper>` on vynta-start                           |
| `stateDir`             | string  | `~/.local/state/vynta` | Where `.theme` and `.wallpaper` runtime files live                          |
| `palettes`             | attrset | built-in palettes      | Palette definitions                                                         |
| `templates`            | attrset | built-in templates     | Template functions                                                          |
| `targets`              | attrset | `{}`                   | Generated-file → destination mappings, populated by target modules          |
| `starterExtraCommands` | string  | `""`                   | Shell commands appended to `vynta-start`, for host-specific launchers, etc. |

## Built-in palettes

| Name           | Type  |
| -------------- | ----- |
| `gorgoroth`    | dark  |
| `archdaemon`   | dark  |
| `odysseus`     | dark  |
| `handmadehero` | dark  |
| `nier`         | light |
| `nier-dark`    | dark  |
| `nord`         | dark  |

## Target modules

Each app target is opt-in. I used my default path for all of them, maybe i'll
add a target dir like i did for zen/obsidian later.

Enable what you use:

```nix
themes = {
  # GTK / QT
  targets-gtk.enable  = true;
  targets-qt.enable   = true;

  # Editors
  targets-helix.enable = true;
  targets-emacs.enable = true;
  targets-nvim.enable  = true;
  targets-kak.enable   = true;

  # Obsidian
  targets-obsidian.enable     = true;
  # targets-obsidian.vaultDir = "~/Documents/Notes/<username>/.obsidian";

  # Terminals
  targets-foot.enable    = true;
  targets-wezterm.enable = true;
  targets-zellij.enable  = true;

  # Terminal utils
  targets-yazi.enable    = true;
  targets-zathura.enable = true;
  targets-lazygit.enable = true;
  targets-fzf.enable     = true;
  targets-rofi.enable    = true;

  # Desktop
  targets-niri.enable      = true;
  targets-caelestia.enable = true;

  # Browser
  targets-zen.enable     = true;
  # targets-zen.profileDir = "~/.config/zen/<username>";

  # Discord
  targets-vesktop.enable      = true;
  targets-discordcanary.enable = true;

  # Other
  targets-fcitx5.enable = true;
  targets-dunst.enable  = true;
  targets-eww.enable    = true;

  # Nushell
  targets-nushell = {
    enable = true;
    # requires explicit file path, nushell should source this file to have colors change on the fly.
    file   = "/path/to/your/nushell/colors.nu";
  };
};
```

## Adding custom palettes or targets

Merge your own palettes on top of the built-ins:

```nix
themes.palettes = inputs.vynta.builtinPalettes // {
  my-theme = import ./palettes/my-theme.nix;
};
```

See the built-in palettes in `palettes/` for the expected structure. The minimum
required fields are under `must`:

```nix
# Non-lazy palette (full control)
{
  isLazy = false;
  type   = "dark";  # or "light"
  must = {
    bg                   = "#1a1a1a";
    fg                   = "#e0e0e0";
    primary              = "#5f8787";
    secondary            = "#87875f";
    tertiary             = "#87605f";
    error                = "#cc6666";
    dim                  = "#555555";
    surface_container    = "#222222";
    surface_container_high = "#2a2a2a";
  };
}
```

Or for custom targets you want to define:

```nix
themes.targets = {
  "my-app/theme.conf" = "${config.home.homeDirectory}/.config/my-app/theme.conf";
};
```

### Target paths

Most target modules have hardcoded default destination paths following XDG
conventions (`~/.config/<app>/...`). These defaults match a typical setup but
may not fit everyone.

Currently there is no option to override destination paths per-app — the path is
whatever the module sets. To use a non-standard path, disable the module and add
the target manually:

```nix
themes.targets-helix.enable = false;  # disable the module
themes.targets."helix/themes/current.toml" = "/my/custom/path/current.toml";  # set manually
```

Check `modules/targets/<app>.nix` to see the exact default path for each app.

Overridable path options per target module is on the todo list.

## Runtime usage

After `home-manager switch`, two commands are available:

```bash
vynta <theme-name>    # switch to a theme immediately
vynta-start           # restore last theme (called at login via autostart)
```

List available themes:

```bash
vynta
```

---
