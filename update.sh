#!/bin/sh

FILENAME="Zenburn.dvtcolortheme"
CONFIG="$HOME/Library/Developer/Xcode/UserData/FontAndColorThemes/"
REPO=$(pwd)

echo "\n""Overwrite Zenburn.dvtcolortheme in Library or in Repository?"

select result in Library Repository Cancel
do
    if [ "$result" = "Library" ]; then
        echo "\n""Update Zenburn.dvtcolortheme in ~/Library"
        ln -fsv "${REPO}/${FILENAME}" "${CONFIG}${FILENAME}"
    elif [ "$result" = "Repository" ]; then
        echo "\n""Update Zenburn.dvtcolortheme in Repository"
        cp -fv "${CONFIG}${FILENAME}" "./${FILENAME}"
        ln -fsv "${REPO}/${FILENAME}" "${CONFIG}${FILENAME}"
    else
        echo "\n"Cancelled"\n"
    fi
    exit
done

