{ config, pkgs, ... }:
{
programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
        edit = "sudo -e";
        update = "cd ~/nixos && sudo nixos-rebuild switch --flake . && cd -";
	ls="lsd";
	la="lsd -a";
	ll="lsd  -l";
	lla="lsd  -la";
	rt="lsd  --tree";
	".."="z ..";

	zfc="source ~/.zshrc";
	df="df -h";
	free="free -h";
	G="git status";
	g="git";
	gd="git diff";
	hr="eval $(history | fzf)";
	hs="echo $(history | fzf)";
	ov="nvim $(fzf)";
	hv="nvim $(fd . -H | fzf)";

	cv="nvim $(fd . ~/.config/ -H | fzf)";
	cf="fd . ~/.config/ -H | fzf";
	dots="cd && nvim $(yadm ls-files | fzf) && cd -";
	books="cd ~/Downloads/books && xdg-open \"$(fzf)\" && cd -";
	ys="yadm status";
	yd= "yadm diff";
	docker-rmi="sudo docker rmi \$(sudo docker images | fzf --sync --multi| awk '{print \$3}')";
	docker-rm="sudo docker rm \$(sudo docker ps -a | fzf --sync --multi| awk '{print $1}')";
	tmux="tmux -u";
    };

    histSize = 5000;
    histFile = "$HOME/.zsh_history";
    interactiveShellInit = "
	    source ${pkgs.zsh-vi-mode}/share/zsh-vi-mode/zsh-vi-mode.plugin.zsh;
	    eval \"$(${pkgs.zoxide}/bin/zoxide init zsh)\";  
	    eval \"$(${pkgs.starship}/bin/starship init zsh)\";
    ";
    setOptions = [
      "HIST_IGNORE_ALL_DUPS"
    ];
  };
}
