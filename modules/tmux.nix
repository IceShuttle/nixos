{pkgs, ...}: {
  programs.tmux = {
    enable = true;
    # shortcut = "a";
    # aggressiveResize = true; -- Disabled to be iTerm-friendly
    baseIndex = 1;
    newSession = true;
    # Stop tmux+escape craziness.
    escapeTime = 0;
    # Force tmux to use /tmp for sockets (WSL2 compat)
    # secureSocket = false;
    clock24 = true;
    historyLimit = 50000;

    plugins = with pkgs; [
      tmuxPlugins.better-mouse-mode
      tmuxPlugins.vim-tmux-navigator
      tmuxPlugins.sensible
      tmuxPlugins.catppuccin
      tmuxPlugins.yank
      tmuxPlugins.resurrect
    ];

    extraConfig = ''
      set -g prefix C-b
      set -g mouse on
      set -g status-position bottom
      set -g pane-base-index 1

      set-option -g default-shell "${pkgs.zsh}/bin/zsh"
      set-option -sa terminal-overrides ",xterm*:Tc"

      bind-key h select-pane -L
      bind-key j select-pane -D
      bind-key k select-pane -U
      bind-key l select-pane -R


      set-window-option -g mode-keys vi

      bind-key -T copy-mode-vi v send-keys -X begin-selection
      bind-key -T copy-mode-vi C-v send-keys -X rectangle-toggle
      bind-key -T copy-mode-vi y send-keys -X copy-selection-and-cancel
    '';
  };
}
