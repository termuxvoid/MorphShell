if status is-interactive
    # Commands to run in interactive sessions can go here
end
function fish_greeting
tte -i ~/.config/morfshell --random-effect
end
# navigation
alias ..='cd ..'
alias ....='cd ../..'
alias ......='cd ../../..'
alias .3='cd ../../..'
alias .4='cd ../../../..'
alias .5='cd ../../../../..'

alias cat='bat -pp'

alias clear='bash -c "clear"; fish_greeting'
alias clr='tput clear'

alias la='eza -al --color=always --group-directories-first'
alias ls='eza --color=always --group-directories-first'
alias ll='eza -l --color=always --group-directories-first'
alias lt='eza -a --color=always --group-directories-first'

starship init fish | source
