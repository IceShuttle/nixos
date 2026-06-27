{
  config,
  pkgs,
  ...
}: {
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "shivang";
  home.homeDirectory = "/home/shivang";
  imports = [];

  home.stateVersion = "26.05"; # Please read the comment before changing.

  home.packages = [
    # pkgs.magnetic-catppuccin-gtk
    pkgs.bat
  ];

  home.file = {
  };

  home.sessionVariables = {
    # GTK_THEME = "Catppuccin-GTK-Dark";
    # EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
