# Dotfiles tracking using git


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

`echo ".dotgit" >> .gitignore

- Clone existing repo into bare repo
`git clone --bare <git-repo-url> $HOME/.dotgit`

- Create alias to use for dotfile processing

`alias dotgit='/usr/bin/git --git-dir=$HOME/.dotgit/ --work-tree=$HOME'`

- Checkout the content of the bare repo to the `$HOME` directory

`git checkout`

- If an error occurs it is because some files might already exist in the `$HOME` dir. They can be backed up with this script:

```
mkdir -p .dotfiles-backup && \
dotgit checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | \
xargs -I{} mv {} .dotfiles-backup/{}
```

- You can now run `git checkout` again

- Set a local flag for the dotgit repository to not show untracked files to avoid showing untracked files

`dotgit config --local status.showUntrackedFiles no`

## Sources

- Hacker News Article: https://news.ycombinator.com/item?id=11070797
- Atlassian blog: https://www.atlassian.com/git/tutorials/dotfiles
- Another Working Example: https://github.com/Siilwyn/my-dotfiles/tree/master/.my-dotfiles
