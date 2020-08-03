#!/bin/sh

apt update

# install following tools
apt install -y \
	golang


# export paths
echo "export PATH=$PATH:/$HOME/go/bin" >> $HOME/.bashrc
echo "export GOPATH=$HOME/go"
