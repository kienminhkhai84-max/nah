#!/bin/bash

# 1. Cập nhật hệ thống thầm lặng
sudo apt update -y > /dev/null

# 2. Cài đặt XFCE và XRDP (Bản tối giản để tránh bị quét)
sudo DEBIAN_FRONTEND=noninteractive apt install -y xfce4 xfce4-goodies xrdp > /dev/null

# 3. Tạo user hieudz và cấp quyền đại ca
sudo useradd -m hieudz
echo "hieudz:123" | sudo chpasswd
sudo usermod -aG sudo hieudz

# 4. Cấu hình môi trường đồ họa cho user hieudz
echo "xfce4-session" > /home/hieudz/.xsession
sudo chown hieudz:hieudz /home/hieudz/.xsession
sudo adduser xrdp ssl-cert

# 5. Cài đặt ngrok bản mới nhất
curl -sSL https://ngrok-agent.s3.amazonaws.com/ngrok.asc | sudo tee /etc/apt/trusted.gpg.d/ngrok.asc >/dev/null
echo "deb https://ngrok-agent.s3.amazonaws.com buster main" | sudo tee /etc/apt/sources.list.d/ngrok.list
sudo apt update -y > /dev/null
sudo apt install ngrok -y > /dev/null

# 6. Khởi động lại dịch vụ
sudo service xrdp restart
