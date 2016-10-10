#!/bin/bash

lsb_release="$(perl -nle 'print $1 if/.*DISTRIB_RELEASE=(.*)/' /etc/lsb-release)"

cp tmux ~/.tmux.conf
cp screenrc ~/.screenrc
cp -R vim ~/.vim
cp vimrc ~/.vimrc
cp spacemacs ~/.spacemacs

mkdir -p ~/.ncmpcpp

if [[ "$lsb_release" =~ ^16 ]] || [[ "$lsb_release" =~ ^18 ]]; then

  cp ncmpcpp_config_16.04 ~/.ncmpcpp/config

fi

if [[ "$lsb_release" =~ ^14 ]] || [[ "$lsb_release" =~ ^17 ]] ; then

  cp ncmpcpp_config_14.04 ~/.ncmpcpp/config

fi


