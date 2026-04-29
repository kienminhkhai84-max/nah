#!/bin/bash
apt update
apt install xfce4 xfce4-goodies xrdp -y
adduser xrdp ssl-cert
echo xfce4-session >~/.xsession
service xrdp restart
wget https://bin.equinox.io/c/4VmD4z7iaB8/ngrok-stable-linux-amd64.zip
unzip ngrok-stable-linux-amd64.zip
