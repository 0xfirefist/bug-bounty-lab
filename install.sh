#!/bin/sh

apt update

# adding golang ppa
sudo add-apt-repository -y ppa:longsleep/golang-backports

# install following tools
apt install -y \
	golang \
	dnsrecon \
	python \
	python-pip

# install gobuster
go get github.com/OJ/gobuster
# install ffuf
go get github.com/ffuf/ffuf
# sublist3r
mkdir $HOME/tools/
cd $HOME/tools/
git clone https://github.com/aboul3la/Sublist3r.git
cd Sublist3r
pip install -r requirements.txt
ln -s ~/Sublist3r/sublist3r.py /usr/sbin/sublist3r 

# export paths
echo "export PATH=$PATH:/$HOME/go/bin" >> $HOME/.bashrc
echo "export GOPATH=$HOME/go"

# adding wordlists for the ctf challenge
mkdir $HOME/ctfchallenge
mkdir $HOME/ctfchallenge/wordlists
cd $HOME/ctfchallenge/wordlists
wget https://raw.githubusercontent.com/danielmiessler/SecLists/master/Passwords/Common-Credentials/10-million-password-list-top-100.txt
wget https://raw.githubusercontent.com/danielmiessler/SecLists/master/Passwords/Common-Credentials/10-million-password-list-top-10000.txt
wget https://raw.githubusercontent.com/danielmiessler/SecLists/master/Discovery/DNS/namelist.txt
wget https://raw.githubusercontent.com/danielmiessler/SecLists/master/Discovery/Web-Content/burp-parameter-names.txt
wget https://raw.githubusercontent.com/danielmiessler/SecLists/master/Discovery/Web-Content/common.txt
