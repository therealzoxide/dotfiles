if status is-interactive
	set fish_greeting
	fastfetch

	alias la='ls -a'
	alias ls='ls -l'
	alias lt='ls -t'
	alias ..='cd ..'
	alias ....='cd ../..'
	alias ......='cd ../../..'

	function starship_transient_prompt_func
	  starship module character
	end
	starship init fish | source
	enable_transience

	function fish_postexec --on-event fish_postexec
	    shell_motivation
	end

end

set -gx EDITOR nvim


