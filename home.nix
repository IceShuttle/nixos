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

  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "text/plain" = ["neovide.desktop"];
      "application/pdf" = ["zathura.desktop"];
      "image/*" = ["feh.desktop"];
      "video/*" = ["mpv.desktop"];
    };
  };

  home.packages = [
    # pkgs.magnetic-catppuccin-gtk
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
