{pkgs, ...}: {
  stylix = {
    enable = true;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";
    polarity = "dark";
    targets.nvf.enable = false;
    icons = {
      enable = true;
      package = pkgs.catppuccin-papirus-folders;
      light = "Papirus-Light";
      dark = "Papirus-Dark";
    };
  };
}
