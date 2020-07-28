# User specific aliases and functions loaded by `~/.bashrc`

## addalias function to add aliases to `.bash_aliases` and source the file
addalias() {
    printf "alias %s='%s'\n" "$1" "$2" >> ~/.bash_aliases
    source ~/.bash_profile
}

## ssh start $SHELL if tmux not found
ssh () {
    if [ $# -eq 0 ]; then
        command ssh
    else
        command ssh -t "$@" -- 'tmux -u new -A -s 0 2>/dev/null || "$SHELL"'
    fi
}

## Coloured `ls`
alias ls='ls --color=auto'

## Coloured `less`
export LESS=-R
#export LESS_TERMCAP_mb=$'\E[1;31m'     # begin blink
#export LESS_TERMCAP_md=$'\E[1;36m'     # begin bold
#export LESS_TERMCAP_me=$'\E[0m'        # reset bold/blink
#export LESS_TERMCAP_so=$'\E[01;44;33m' # begin reverse video
#export LESS_TERMCAP_se=$'\E[0m'        # reset reverse video
#export LESS_TERMCAP_us=$'\E[1;32m'     # begin underline
#export LESS_TERMCAP_ue=$'\E[0m'        # reset underline
export GROFF_NO_SGR=1				   # for gnome-terminal 

## Coloured `grep`
alias grep='grep --color=auto'

## dotgit for git dotfiles including autocompletion
alias dotgit='/usr/bin/git --git-dir=/home/returntrip/.dotgit/ --work-tree=/home/returntrip'
[ -f "/usr/share/bash-completion/completions/git" ] && source /usr/share/bash-completion/completions/git
__git_complete dotgit _git

## Interactive cp, mv and rm commands
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'

## Coloured diff
alias diff='diff --color=auto'

## Coloured `dmesg`
alias dmesg='dmesg --color=always'

## nvim flatpak
alias vim='io.neovim.nvim'

## added by `addalias`
alias codium='toolbox run --container vscode bash -l -c codium'
alias dnf='toolbox run sudo dnf'
alias exip='curl -s https://checkip.amazonaws.com'
alias fedpkg='toolbox run fedpkg'
alias koji='toolbox run koji'
alias rust2rpm='toolbox run rust2rpm'
