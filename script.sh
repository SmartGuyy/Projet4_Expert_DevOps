#!/bin/bash
# WARNING : wait till script finished running

sudo dnf update -y 

# installing GUI tools
sudo dnf groupinstall -y gnome-desktop
sudo dnf install -y xorg*

# removing useless tools
sudo dnf remove -y initial-setup initial-setup-gui

# set persistent GUI
systemctl isolate graphical.target
systemctl set-default graphical.target

# installing tools
sudo dnf install -y device-mapper-persistent-data lvm2 nano firefox

## installing pelican and gitlab ##

# install python 2

sudo dnf install python2 -y

# install pelican with python2

pip2 install pelican
pip2 install Markdown
pip2 install typogrify

# For system performance purposes, it is recommended to configure the kernel's swappiness setting to a low value like 10:

echo 'vm.swappiness=10' | sudo tee -a /etc/sysctl.conf
sudo sysctl -p
cat /proc/sys/vm/swappiness

# Use the following commands to setup a hostname, gitlab, and an FQDN, gitlab.example.com, for the machine:

sudo hostnamectl set-hostname gitlab
cat <<EOF | sudo tee /etc/hosts
127.0.0.1   localhost localhost.localdomain localhost4 localhost4.localdomain4
::1         localhost localhost.localdomain localhost6 localhost6.localdomain6
127.0.0.1 gitlab.example.com gitlab
EOF

## install Epel YUM repo ## 

sudo dnf install -y epel-release
sudo dnf -y update

## Install required dependencies ##

sudo dnf install -y curl openssh-server openssh-clients

## Setup the GitLab RPM repo and then install GitLab CE ##

cd
curl -sS https://packages.gitlab.com/install/repositories/gitlab/gitlab-ce/script.rpm.sh | sudo bash
sudo EXTERNAL_URL="http://gitlab.example.com" dnf install -y gitlab-ce

# configure and set online Gitlab ressources
sudo gitlab-ctl reconfigure

# set keyboard to french
sudo localectl set-keymap fr

reboot now