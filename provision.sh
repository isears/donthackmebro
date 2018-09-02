#!/bin/bash

# apt packages
apt-get update
apt-get -y upgrade
apt-get -y install vim build-essential gcc-multilib g++-multilib gdb python3-pip \
    default-jdk openvpn git tmux nmap curl valgrind linux-headers-$(uname -r)

# pip packages
pip3 install requests

# gdb peda extensions
rm -rf /home/vagrant/peda
rm -rf /home/vagrant/.gdbinit
git clone https://github.com/longld/peda.git /home/vagrant/peda
echo "source /home/vagrant/peda/peda.py" >> /home/vagrant/.gdbinit
chown vagrant:vagrant /home/vagrant/.gdbinit
chown -R vagrant:vagrant /home/vagrant/peda

# go programming language
curl -O https://dl.google.com/go/go1.11.linux-amd64.tar.gz
echo "b3fcf280ff86558e0559e185b601c9eade0fd24c900b4c63cd14d1d38613e499 go1.11.linux-amd64.tar.gz" | sha256sum -c

if [ $? == 0 ]; then
    tar -xvf go1.11.linux-amd64.tar.gz
    rm -rf /usr/local/go
    mv go /usr/local/

    bashrc_lastline=`tail -n 1 /home/vagrant/.bashrc`

    if [ "$bashrc_lastline" != "export PATH=$PATH:/usr/local/go/bin" ]; then
        echo "export PATH=$PATH:/usr/local/go/bin" >> /home/vagrant/.bashrc
    fi

else
    echo "WARNING: Bad checksum for go, skipping installation"
fi

# rename
echo "donthackmebro" > /etc/hostname
sed -i 's:stretch:donthackmebro:g' /etc/hosts

# restart
reboot