#!/bin/bash

function install_dependencies_rhel8 {
    # Install EPEL repository
    sudo dnf -y install https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm
    sudo dnf -y update
    # Install additional packages
    sudo dnf -y install git gcc gcc-c++ ansible nodejs gettext device-mapper-persistent-data lvm2 bzip2 python3-pip libseccomp
    # Install Docker
    sudo dnf config-manager --add-repo=https://download.docker.com/linux/centos/docker-ce.repo
    sudo dnf -y install docker-ce
    sudo alternatives --set python /usr/bin/python3
    sudo systemctl start docker
    sudo systemctl enable docker
    sudo usermod -aG $USER && newgrp docker
    # Install Docker Compose
    pip3 install docker-compose
}

function install_dependencies_rhel7 {
    # Install EPEL repository
    sudo yum -y install https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
    sudo yum -y update
    # Install additional packages
    sudo yum -y install git gcc gcc-c++ ansible nodejs gettext device-mapper-persistent-data lvm2 bzip2 python3-pip libseccomp wget
    # Install Docker
    sudo wget https://download.docker.com/linux/centos/docker-ce.repo --directory-prefix /etc/yum.repos.docker
    sudo yum -y install docker-ce
    sudo systemctl start docker
    sudo systemctl enable docker
    sudo usermod -aG $USER && newgrp docker
    # Install Docker Compose
    pip3 install docker-compose
}

function install_awx {
    # Clone repo
    git clone -b 18.0.0 https://github.com/ansible/awx.github
    
}

if grep -q -i "release 8" /etc/redhat-release
then
    install_dependencies_rhel8
elif grep -q -i "release 7" /etc/redhat-release
then
    install_dependencies_rhel7
else
    echo "ERROR: Platform not recognised. Aborting installation."
    exit 1
fi

