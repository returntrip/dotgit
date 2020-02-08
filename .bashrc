# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
# dotgit for git dotfiles including autocompletion
alias dotgit='/usr/bin/git --git-dir=/home/returntrip/.dotgit/ --work-tree=/home/returntrip'
[ -f "/usr/share/bash-completion/completions/git" ] && source /usr/share/bash-completion/completions/git
__git_complete dotgit _git

# Interactive cp, mv and rm commands
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'
# Coloured diff
alias diff='diff --color=auto' dmesg='dmesg --color=always'
# Coloured manpages
man() {
    LESS_TERMCAP_md=$'\e[01;31m' \
    LESS_TERMCAP_me=$'\e[0m' \
    LESS_TERMCAP_se=$'\e[0m' \
    LESS_TERMCAP_so=$'\e[01;44;33m' \
    LESS_TERMCAP_ue=$'\e[0m' \
    LESS_TERMCAP_us=$'\e[01;32m' \
    command man "$@"
}
# Ignore command beginnig with space charater
export HISTCONTROL=ignoreboth
# If outside a toolbox use nvim instead of vim
if [[ "$(hostname)" != "toolbox" ]]; then
	alias vim='io.neovim.nvim'
fi
