# .bashrc

# ble.sh
[[ $- == *i* ]] && source ~/.local/share/blesh/ble.sh --noattach

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Create pathmunge to avoid path duplications
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
if ! [[ "$PATH" =~ "$HOME/.local/bin" ]] ; then
    pathmunge $HOME/.local/bin
fi

if ! [[ "$PATH" =~ "$HOME/bin" ]] ; then
    pathmunge $HOME/bin
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

# Update window size after every command 
shopt -s checkwinsize

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

# Set $EDITOR and $PAGER
export EDITOR=vim
export PAGER=less

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
    pathmunge $HOME/.local/toolbox/bin after
	export TERM=xterm-256color
fi

export PATH
unset -f pathmunge

# CDPATH
CDPATH=/home/returntrip/devel:/home/returntrip/devel/repos:/home/returntrip/Nextcloud
CDPATH=$CDPATH:/home/returntrip/devel/packaging:/home/returntrip/Nextcloud/Documents
export CDPATH

# Turn on parallel history with starship
# https://github.com/starship/starship/issues/1337#issuecomment-644690560
# https://github.com/ZeePal/workstation-ubuntu/blob/master/roles/starship/tasks/main.yml#L128
shopt -s histappend
eval "$(starship init bash)"
 function _pre_starship_prompt_commands {
     local STATUS=$?  # Passthrough the last exit code for starship
     history -a
     return $STATUS
}
PROMPT_COMMAND="_pre_starship_prompt_commands;starship_precmd"

# ble.sh
[[ ${BLE_VERSION-} ]] && ble-attach
