#!/bin/bash

# 1. Cập nhật hệ thống
sudo apt update

# 2. Cài đặt giao diện Ubuntu Desktop mặc định (GNOME)
# Dùng bản minimal để tránh cài các app rác, giúp máy chạy nhanh hơn
sudo DEBIAN_FRONTEND=noninteractive apt install -y ubuntu-desktop-minimal xrdp

# 3. Cấu hình để XRDP nhận diện giao diện GNOME của Ubuntu
echo "gnome-session" > ~/.xsession
sudo adduser xrdp ssl-cert
sudo service xrdp restart

# 4. Cài đặt ngrok bản mới nhất (Repository chính thức)
curl -sSL https://ngrok-agent.s3.amazonaws.com/ngrok.asc \
  | sudo tee /etc/apt/trusted.gpg.d/ngrok.asc >/dev/null \
  && echo "deb https://ngrok-agent.s3.amazonaws.com buster main" \
  | sudo tee /etc/apt/sources.list.d/ngrok.list \
  && sudo apt update \
  && sudo apt install ngrok -y

echo "-----------------------------------"
echo "Đã cài xong giao diện Ubuntu rồi ạ!"
echo "-----------------------------------"
