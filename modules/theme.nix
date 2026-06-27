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
    fonts = {
      sizes = {
        applications = 12;
        terminal = 15;
        desktop = 10;
        popups = 10;
      };
      monospace = {
        package = pkgs.nerd-fonts.jetbrains-mono;
        name = "JetBrainsMonoNF";
      };
      sansSerif = {
        package = pkgs.dejavu_fonts;
        name = "DejaVu Sans";
      };
      serif = {
        package = pkgs.dejavu_fonts;
        name = "DejaVu Serif";
      };
    };
  };
}
