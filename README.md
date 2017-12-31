# Johnny's Vim Setup

## Installation

### Cloning and Symbolic link
First, chone this repo at your home and make a symbolic link for default vim loading file ~/.vimrc
```
# cd ~
# git clone https://github.com/johnnykwwang/.dotfiles
# ln -s ~/.dotfiles/.vimrc ~/.vimrc
```
### Install vim-plug
```
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```
Then enter vim and install plugins by `:PlugInstall`

### Enjoy
