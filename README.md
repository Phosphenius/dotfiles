# My dotfiles

## Usage

```bash
git clone --bare https://github.com/Phosphenius/dotfiles.git $HOME/.dotfiles.git
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles.git/ --work-tree=$HOME'
dotfiles checkout
dotfiles config --local status.showUntrackedFiles no
```
