#!/usr/bin/env bash

source $HOME/.dotfiles/install/helix.sh

ln -svf $HOME/.dotfiles/shell/bash/.bashrc ~
ln -svf $HOME/.dotfiles/shell/bash/.bash_profile ~
ln -svf $HOME/.dotfiles/shell/sh/aliases.sh ~/.bash_aliases
ln -svf $HOME/.dotfiles/shell/env/linux.sh ~/.env
