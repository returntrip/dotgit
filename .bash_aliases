# User specific aliases and functions loaded by `~/.bashrc`

## addalias function to add aliases to `.bash_aliases` and source the file
addalias() {
    printf "alias %s='%s'\n" "$1" "$2" >> ~/.bash_aliases
    source ~/.bash_profile
}

## ssh start $SHELL if tmux not found
ssh () {
    TERM=xterm
    if [ $# -eq 0 ]; then
        command ssh
    elif [ $# -gt 1 ]; then
        command ssh "$@"
    else
        command ssh -t "$1" -- 'tmux -u new -A -D -s 0 2>/dev/null || "$SHELL"'
    fi
}

## PGP Enc/Dec functions
secret () {
        output=~/"${1}".$(date +%s).enc
        gpg --encrypt --armor --output ${output} -r 0xE8D9210D206385D6 -r stefano@figura.im "${1}" && echo "${1} -> ${output}"
}

reveal () {
        output=$(echo "${1}" | rev | cut -c16- | rev)
        gpg --decrypt --output ${output} "${1}" && echo "${1} -> ${output}"
}

## Coloured `ls`
alias ls='ls --color=auto'

## Coloured `less`
export LESS=-R
export LESS_TERMCAP_mb=$'\E[1;31m'     # begin blink
export LESS_TERMCAP_md=$'\E[1;36m'     # begin bold
export LESS_TERMCAP_me=$'\E[0m'        # reset bold/blink
export LESS_TERMCAP_so=$'\E[01;44;33m' # begin reverse video
export LESS_TERMCAP_se=$'\E[0m'        # reset reverse video
export LESS_TERMCAP_us=$'\E[1;32m'     # begin underline
export LESS_TERMCAP_ue=$'\E[0m'        # reset underline
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
alias exip='curl -s https://checkip.amazonaws.com'
#alias fedpkg='toolbox run fedpkg'
#alias koji='toolbox run koji'
#alias rust2rpm='toolbox run rust2rpm'
#alias dnf='toolbox run sudo dnf'
#alias ranger='toolbox run --container sway ranger'
#alias mpv='toolbox run --container sway mpv'
