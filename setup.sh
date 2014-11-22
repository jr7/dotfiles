#!/usr/bin/env bash

link_list=()
link_list+=("i3config:$HOME/.i3/config")
link_list+=("bashrc:$HOME/.bashrc")
link_list+=("inputrc:$HOME/.inputrc")
link_list+=("vimrc:$HOME/.vimrc")
link_list+=("vim:$HOME/.vim")
link_list+=("gitconfig:$HOME/.gitconfig")
link_list+=("sshconfig:$HOME/.ssh/config")

function make_link() {
    if [ ! -e $2 ]
    then
        echo "ln -s \"$1\" \"$2\""
        ln -s $1 $2
    else
        echo "Target \"$2\" already exists - skipping."
    fi
}

git submodule init
git submodule update

cp vim/pathogen/autoload/pathogen.vim vim/autoload/pathogen.vim

for link in "${link_list[@]}"
do
    src="$(pwd)/$(echo $link | cut -d':' -f1)"
    dest=$(echo $link | cut -d':' -f2)
    make_link "$src" "$dest"
done

