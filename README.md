# Dotfiles tracking using git

## Version

- Initial version. Was created on Fedora Silverblue but should be distro agnostic
- Minimal customisation. To be kept mostly vanilla in order to be used with other distros
- Contains `gpg` customisation for YUbikey (pgp/ssh usage)
- Check other branched for customised version (i.e. Fedora Silverblue with `toolbox`)
## First Time Setup

- Initialise bare git repo

`git init --bare $HOME/.dotgit`

- Create alias to use for dotfile processing

`alias dotgit='/usr/bin/git --git-dir=$HOME/.dotgit/ --work-tree=$HOME'`

- Set a local flag for the dotgit repository to not show untracked files to avoid showing untracked files

`dotgit config --local status.showUntrackedFiles no`

- Add the alias to .bashrc

`echo "alias dotgit='/usr/bin/git --git-dir=$HOME/.dotgit/ --work-tree=$HOME'" >> $HOME/.bashrc`

- Add GitHub remote

`dotgit remote add origin <remote>`

## Usage

```
dotgit status
dotgit add .vimrc
dotgit commit -m "Add vimrc"
dotgit add .bashrc
dotgit commit -m "Add bashrc"
dotgit push
```

### Additional system setup

- Add the alias to .bashrc

`echo "alias dotgit='/usr/bin/git --git-dir=$HOME/.dotgit/ --work-tree=$HOME'" >> $HOME/.bashrc`

- Add .dotgit to .gitignore to avoid recursion issues

`echo ".dotgit" >> .gitignore`

- Clone existing repo into bare repo

`git clone --bare <git-repo-url> $HOME/.dotgit`

- Create alias to use for dotfile processing

`alias dotgit='/usr/bin/git --git-dir=$HOME/.dotgit/ --work-tree=$HOME'`

- Checkout the content of the bare repo to the `$HOME` directory

`dotgit checkout`

- If an error occurs it is because some files might already exist in the `$HOME` dir. They can be backed up with this script:

```
mkdir -p .dotfiles-backup && \
dotgit checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | \
xargs -I{} mv {} .dotfiles-backup/{}
```

- You can now run `dotgit checkout` again

- Set a local flag for the dotgit repository to not show untracked files to avoid showing untracked files

`dotgit config --local status.showUntrackedFiles no`

## Sources

- Hacker News Article: https://news.ycombinator.com/item?id=11070797
- Atlassian blog: https://www.atlassian.com/git/tutorials/dotfiles
- Another Working Example: https://github.com/Siilwyn/my-dotfiles/tree/master/.my-dotfiles
- Archlinux Wiki which includes host specific brancing and Filtering: https://wiki.archlinux.org/index.php/Dotfiles#Tracking_dotfiles_directly_with_Git
