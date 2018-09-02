#!/bin/bash

# apt packages
apt-get update
apt-get -y upgrade
apt-get -y install vim build-essential gcc-multilib g++-multilib gdb python3-pip \
    default-jdk openvpn git tmux nmap linux-headers-$(uname -r)

# pip packages
pip3 install requests

# gdb peda extensions
rm -rf /home/vagrant/peda
rm -rf /home/vagrant/.gdbinit
git clone https://github.com/longld/peda.git /home/vagrant/peda
echo "source /home/vagrant/peda/peda.py" >> /home/vagrant/.gdbinit
chown vagrant:vagrant /home/vagrant/.gdbinit
chown -R vagrant:vagrant /home/vagrant/peda