#!/bin/bash

build_opencv=true

# First, update system
apt-get update -y
apt-get upgrade -y

# Install packages
apt -y install vim nano openssh-server wget pkg-config grep gconf2
apt -y install cmake make gcc g++ git gitk python3 python3-venv python3-pip python3-dev python3-numpy podman
apt -y install build-essential pkg-config libgtk-3-dev \
    libavcodec-dev libavformat-dev libswscale-dev libv4l-dev \
    libxvidcore-dev libx264-dev libjpeg-dev libpng-dev libtiff-dev \
    gfortran openexr libatlas-base-dev \
    libtbb2 libtbb-dev libopenexr-dev \
    libgstreamer-plugins-base1.0-dev libgstreamer1.0-dev

# Build and install opencv4
if [ "$build_opencv" == "true" ]; then
    git clone https://github.com/opencv/opencv.git
    cd opencv
    git checkout tags/4.5.5
    mkdir build
    cd build
    cmake ..
    num_logical_procs=`grep -c ^processor /proc/cpuinfo`
    make -j$num_logical_procs install
fi


# Edit the file /etc/systemd/logind.conf, uncomment the line with HandleLidSwitch, and set value to ignore
# Same for HandleLidSwitchACPower

# Blank screen when lid closed
gconftool-2 -t string -s /apps/gnome-power-manager/buttons/lid_ac blank
