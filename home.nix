{
  inputs,
  config,
  pkgs,
  ...
}: {
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "shivang";
  home.homeDirectory = "/home/shivang";
  imports = [
    inputs.nix-doom-emacs-unstraightened.homeModule
    ./modules/zsh.nix
  ];

  home.stateVersion = "26.05"; # Please read the comment before changing.

  programs.direnv.enable = true;
  programs.direnv.silent = true;

  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "text/plain" = ["neovide.desktop"];
      "application/pdf" = ["zathura.desktop"];
      "image/*" = ["feh.desktop"];
      "video/*" = ["mpv.desktop"];
    };
  };
  services.emacs.enable = true;
  programs.doom-emacs = {
    enable = true;
    doomDir = ./doom.d;
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
