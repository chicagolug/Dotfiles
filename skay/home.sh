#!/usr/bin/env bash

set -e

cd

# you are not me, so you would not want to use the git@github...etc url
git clone git@github.com:codersquid/dotfiles.git .dotfiles
git clone git@github.com:codersquid/vimdots.git .vim

ln -s .dotfiles/_tmux.conf .tmux.conf

## this was when I was playing with using the git contrib bash stuff
## but I like the oh-my-zsh git prompt theme more
##
#cd .dotfiles
#wget https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash
#wget https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh
#cd

cd .vim
git submodule init
git submodule update
cd ..
ln -s .vim/_vimrc .vimrc
