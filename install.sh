#!/bin/bash

dotfiles="emacs.d gitconfig xinitrc xmodmap"

for f in $dotfiles
do
    from=`realpath $f`
    to="$HOME/.$f"

    if [ -e $to ]
    then
        echo "remove $to"
        rm $to -rf
    fi

    echo "$to -> $from"
    ln -s $from $to
done
