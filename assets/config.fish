if status is-interactive
    # Commands to run in interactive sessions can go here
end
function fish_greeting
tte --frame-rate 666 -i ~/.config/morphshell --random-effect --exclude-effects matrix
end
# navigation
alias ..='cd ..'
alias ....='cd ../..'
alias ......='cd ../../..'
alias .3='cd ../../..'
alias .4='cd ../../../..'
alias .5='cd ../../../../..'

# clear variable
alias clear='bash -c "clear"; fish_greeting'
alias clr='tput clear'


# colorfull ls using eza
alias la='eza -al --color=always --group-directories-first'
alias ls='eza --color=always --group-directories-first'
alias ll='eza -l --color=always --group-directories-first'
alias lt='eza -a --color=always --group-directories-first'

# colors for man page and less output
export LESS_TERMCAP_mb=$(tput bold; tput setaf 1)
export LESS_TERMCAP_md=$(tput bold; tput setaf 1)
export LESS_TERMCAP_me=$(tput sgr0)
export LESS_TERMCAP_se=$(tput sgr0)
export LESS_TERMCAP_so=$(tput bold; tput setaf 3; tput setab 4)
export LESS_TERMCAP_ue=$(tput sgr0)
export LESS_TERMCAP_us=$(tput smul; tput bold; tput setaf 2)
export LESS_TERMCAP_mr=$(tput rev)
export LESS_TERMCAP_mh=$(tput dim)

# colorizes cat output replacing it with bat
alias cat='bat -pp'

starship init fish | source
