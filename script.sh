#!/bin/bash
# WARNING : wait till script finished running

dnf update -y 

# removing previous install of docker
# rm -rf /var/lib/docker
# dnf remove docker docker-ce docker-ce-cli containerd.io

# installing GUI tools
dnf groupinstall -y gnome-desktop
dnf install -y xorg*

# removing useless tools
dnf remove -y initial-setup initial-setup-gui

# set persistent GUI
systemctl isolate graphical.target
systemctl set-default graphical.target

# to add docker repository
# dnf config-manager --add-repo=https://download.docker.com/linux/centos/docker-ce.repo

# to add latest docker-ce version
# dnf install docker-ce --nobest -y

# installing tools
dnf install -y device-mapper-persistent-data lvm2 nano

# installing pelican and gitlab

# install python 2

dnf install python2 -y

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
sudo dnf -y update && sudo shutdown -r now

## Install required dependencies ##

sudo dnf install -y curl policycoreutils-python openssh-server openssh-clients

## Setup the GitLab RPM repo and then install GitLab CE ##

cd
curl -sS https://packages.gitlab.com/install/repositories/gitlab/gitlab-ce/script.rpm.sh | sudo bash
sudo EXTERNAL_URL="http://gitlab.example.com" dnf install -y gitlab-ce

# enabling and starting docker
# systemctl start docker
# systemctl enable docker

# installing ansible
# dnf install https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm -y
# dnf install -y ansible

# set keyboard to french
localectl set-keymap fr

# create Dockerfile and execute it so container is ready on startup
# touch /home/vagrant/Dockerfile
# echo "FROM debian:9 
# EXPOSE 22/tcp
# EXPOSE 80/tcp
# RUN apt-get update -y \\
# && apt-get install -y nginx" >> /home/vagrant/Dockerfile
# we build dockerfile
# docker build -t nginx-projet . -f /home/vagrant/Dockerfile
# start container with port 80 mapped to local port 80 and restart it if it goes down
# docker run -dit --restart unless-stopped --name nginx-projet -p 80:80 -d nginx 

## install firefox IF software package can't find anything !! -- OR fix /etc/yum.repos.d/gitlab_gitlab-ce.repo by removing 2nd entry of "gpgkey" ##
# dnf install wget 
# wget -O- "https://download.mozilla.org/?product=firefox-latest-ssl&os=linux64&lang=en-US" | tar -jx -C /usr/local/
# mv /usr/bin/firefox /usr/bin/backup_firefox
# echo "exclude=firefox" >> /etc/dnf/dnf.conf
# ln -s /usr/local/firefox/firefox /usr/bin/firefox

echo "Please now increase root partition and then increase swap space."

reboot now