## .dotfiles
## START WITH

#### Zsh

[zsh]: $HOME/.zshrc

  Move the file to "$HOME"/.config/zsh/.zshrc and export the following environment variable:

    export ZDOTDIR="$HOME"/.config/zsh

  You can do this in /etc/zshenv (Or /etc/zsh/zshenv, on some distros).
  

## Config files management

1. install stow (gnu stow)
2. clone github .dotfiles to home directory 
	 - git@github.com:stefandango/.dotfiles.git / https://github.com/stefandango/.dotfiles.git
3. run 
```bash
stow */
```
