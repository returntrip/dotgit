# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# create pathmunge to avoid path duplications
pathmunge () {
    case ":${PATH}:" in
        *:"$1":*)
            ;;
        *)
            if [ "$2" = "after" ] ; then
                PATH=$PATH:$1
            else
                PATH=$1:$PATH
            fi
    esac
}

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]] ; then
    pathmunge $HOME/.local/bin:$HOME/bin
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# Source aliases and functions
if [ -f $HOME/.bash_aliases ] ; then
    . $HOME/.bash_aliases
fi

# Prevent file overwrite on stdout redirection
# Use `>|` to force redirection to an existing file
set -o noclobber

# Ignore command beginning with space character and duplicated history entries
HISTCONTROL=ignoreboth

# Enable history expansion with space
# E.g. typing !!<space> will replace the !! with your last command
bind Space:magic-space

# Update window size after every command 
shopt -s checkwinsize

# Turn on parallel history
shopt -s histappend
if [[ -z "$PROMPT_COMMAND" ]] ; then 
    PROMPT_COMMAND='$PROMPT_COMMAND; history -a'; else
	PROMPT_COMMAND='history -a'
fi

# Save multi-line commands as one command
shopt -s cmdhist

# Increase History size
HISTSIZE=500000
HISTFILESIZE=100000

# Use standard ISO 8601 timestamp
# %F equivalent to %Y-%m-%d
# %T equivalent to %H:%M:%S (24-hours format)
HISTTIMEFORMAT='%F %T '

# gpg config with Yubikey
export GPG_TTY="$(tty)"
export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
gpgconf --launch gpg-agent

# User specific environment and startup programs
## To execute flatpaks without needing `fatpak run` including autocomplete
if [[ "$(hostname)" != "toolbox" ]] ; then
    pathmunge /var/lib/flatpak/exports/bin after
fi

## Devtools paths
if [[ -d "$HOME/development/android-studio/bin" ]] ; then
    pathmunge $HOME/development/android-studio/bin after
fi

if [[ -d "$HOME/development/flutter/bin" ]] ; then
    pathmunge $HOME/development/flutter/bin after
fi

if [[ -d "$HOME/development/dart-sdk/bin" ]] ; then
    pathmunge $HOME/development/dart-sdk/bin after
fi

# toolbox customisation
## toolbox path customisation
if [[ "$(hostname)" = "toolbox" ]] ; then
    PATH=$(echo $PATH | sed -e 's;:\?/var/lib/flatpak/exports/bin;;' -e 's;/var/lib/flatpak/exports/bin:\?;;')
    pathmunge $HOME/toolbox/bin after
fi

export PATH
unset -f pathmunge
