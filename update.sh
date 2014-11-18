#!/bin/bash

root=`dirname $0`
# initial run on linux
if [ "$1" == "-init" ]; then
    echo "Start init"
    echo "cp .vim to $root/vim"
    cp -r ~/.vim $root/vim
    rm -rf $root/vim/bundle/*/.git
    echo "cp .vimrc to $root/.vimrc"
    cp  ~/.vimrc $root/.vimrc
    font=$(grep -oP "(?<=font=).*?(?=\\\\)" ~/.vimrc)

    result=$(find /usr/share/fonts /usr/local/share/fonts ~/.fonts ~/.local/share/fonts -name $font*)

    if [[ -n "$result" ]];then
        mkdir $root/fonts
        echo "cp $result $root/fonts"
        cp $result $root/fonts
    fi

    git add --all
    git commit -m "first init"
    git 
elif [ "$1" == "-h" ]; then
    echo "-init to init"
    echo "default for update"
elif [[ -z $1 ]];then
    echo "Start update"
    rm -rf $root/vim
    rm -f $root/.vimrc
    echo "cp .vim to $root/vim"
    cp -r ~/.vim $root/vim
    echo "cp .vimrc to $root/.vimrc"
    cp ~/.vimrc $root/vim
    git add --all
    git commit -m "last update"
else
    echo "-init to init"
    echo "default for update"
fi
