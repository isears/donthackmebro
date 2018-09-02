#!/bin/bash

# apt packages
apt-get update
apt-get -y upgrade
apt-get -y install vim build-essential gcc-multilib g++-multilib gdb python3-pip \
    default-jdk openvpn git tmux linux-headers-$(uname -r)

# pip packages
pip3 install requests

# gdb peda extensions
git clone https://github.com/longld/peda.git /home/vagrant/peda
echo "source /home/peda/peda.py" >> /home/vagrant/.gdbinit
chown vagrant:vagrant /home/vagrant/.gdbinit
chown -R vagrant:vagrant /home/vagrant/peda