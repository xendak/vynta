{ paletteSet, ... }:
let
  p = paletteSet.palette;
in
{
  "picode/themes/current.json" = builtins.toJSON {
    "$schema" =
      "https://raw.githubusercontent.com/earendil-works/pi/main/packages/coding-agent/src/modes/interactive/theme/theme-schema.json";
    name = "current";

    vars = {
      black = p.fg;
      red = 1;
      green = 2;
      yellow = 3;
      blue = 4;
      magenta = 5;
      cyan = 6;
      colorSlow = 1;
      colorMedium = 3;
      colorFast = 4;
      colorBlazing = 2;
      white = p.surface_container_high;
      gray = p.dim;
      faint = p.gray;
      bg1 = p.bg;
      bg2 = p.surface_container;
      bg3 = p.surface_container_low;
      bg4 = p.surface_container_high;
    };

    colors = {
      # :Core
      accent = "cyan";
      border = "blue";
      borderAccent = "cyan";
      borderMuted = "gray";
      success = "green";
      error = "red";
      warning = "yellow";
      muted = "gray";
      dim = "faint";
      text = "";
      thinkingText = "gray";
      scrollbarTrack = "white";
      scrollbarThumb = "bg4";

      # :Backgrounds & content
      selectedBg = "bg4";
      searchMatchBg = "yellow";
      searchMatchText = "black";
      userMessageBg = "bg3";
      userMessageText = "black";
      customMessageBg = "bg2";
      customMessageText = "";
      customMessageLabel = "magenta";
      toolErrorBg = "bg4";
      toolOutput = "gray";
      toolPendingBg = "bg4";
      toolSuccessBg = "bg4";
      toolTitle = "";

      # :Markdown
      mdHeading = "magenta";
      mdLink = "blue";
      mdLinkUrl = "gray";
      mdCode = "blue";
      mdCodeBlock = ""; # check wtf is this
      mdCodeBlockBorder = "gray";
      # maybe change these
      mdQuote = "gray";
      mdQuoteBorder = "gray";
      # end
      mdHr = "gray";
      mdListBullet = "green";

      # :Diffs
      toolDiffAdded = "green";
      toolDiffRemoved = "red";
      toolDiffContext = "gray";

      # :Syntax
      syntaxComment = "gray";
      syntaxKeyword = "magenta";
      syntaxFunction = "blue";
      syntaxVariable = "";
      syntaxString = "green";
      syntaxNumber = "red";
      syntaxType = "cyan";
      syntaxOperator = "";
      syntaxPunctuation = "";
      bashMode = "green";

      # :Thinking ladder
      thinkingOff = "white";
      thinkingMinimal = "gray";
      thinkingLow = "gray";
      thinkingMedium = "cyan";
      thinkingHigh = "magenta";
      thinkingXhigh = "blue";
      thinkingMax = "red";
    };

    export = {
      pageBg = p.bg;
      cardBg = p.surface_container;
      infoBg = p.surface_container_high;
    };
  };
}
