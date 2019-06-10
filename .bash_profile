# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs
# To execute flatpaks without needing `fatpak run` including autocomplete
export PATH="$PATH:/var/lib/flatpak/exports/bin"
