#!/bin/bash

setup() {
        sudo apt remove -y vim-tiny
        sudo apt update
        repo_url="https://github.com/eyalk5/.vim.git"
        dir="$HOME/.vim"
        git clone "$repo_url" "$dir"
        sudo apt-get install python-pip3
        #sudo apt-get build-dep vim
        sudo apt install build-essential cmake ncurses-dev python3-dev #ubuntu 16+
        sudo pip3 install git+git://github.com/Lokaltog/powerline
        cd $HOME
        git clone https://github.com/vim/vim.git
        cd vim/src
        ./configure --with-features=huge \
            --enable-multibyte \
      --enable-rubyinterp=yes \
      --enable-python3interp=yes \
      --with-python3-config-dir=/usr/lib/python3.5/config \
      --enable-perlinterp=yes \
      --enable-luainterp=yes \
        --enable-cscope
        make
        sudo make install
        cd ../..
        rm -r vim #sudo apt-get install -y vim
        cd $dir/plugged/youcompleteme
        python3 install.py --clang-completer
        ln -s "$dir/.vimrc" "$HOME/.vimrc"
        vim +PlugInstall

   }
setup
