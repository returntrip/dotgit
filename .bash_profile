# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs
# To execute flatpaks without needing `fatpak run` including autocomplete


#export PATH="$PATH:~/development/android-studio/bin:~/development/flutter/bin:~/development/dart-sdk/bin"
#export PATH="$PATH:/var/lib/flatpak/exports/bin:~/development/android-studio/bin:~/development/flutter/bin:~/development/dart-sdk/bin"

# toolbox customisation

## If inside toolbox add toolbox bin path
#if [[ "$(hostname)" = "toolbox" ]]; then
#    PATH=$(echo $PATH | sed -e 's;:\?/var/lib/flatpak/exports/bin;;' -e 's;/var/lib/flatpak/exports/bin:\?;;')
#	PATH="~/toolbox/bin:$PATH"
#fi
