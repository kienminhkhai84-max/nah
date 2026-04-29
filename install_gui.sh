#!/bin/bash

# 1. Cập nhật hệ thống
sudo apt update

# 2. Cài đặt Ubuntu Desktop (GNOME) và XRDP
sudo DEBIAN_FRONTEND=noninteractive apt install -y ubuntu-desktop-minimal xrdp

# 3. Tạo user hieudz và đặt mật khẩu mặc định là '123'
# (Anh có thể đổi số 123 ở dòng dưới nếu muốn mật khẩu khác)
sudo useradd -m hieudz
echo "hieudz:123" | sudo chpasswd
sudo usermod -aG sudo hieudz

# 4. Cấu hình giao diện GNOME cho hieudz
echo "gnome-session" > /home/hieudz/.xsession
sudo chown hieudz:hieudz /home/hieudz/.xsession
sudo adduser xrdp ssl-cert

# 5. Cài đặt ngrok bản mới nhất (Repository chính thức)
curl -sSL https://ngrok-agent.s3.amazonaws.com/ngrok.asc \
  | sudo tee /etc/apt/trusted.gpg.d/ngrok.asc >/dev/null \
  && echo "deb https://ngrok-agent.s3.amazonaws.com buster main" \
  | sudo tee /etc/apt/sources.list.d/ngrok.list \
  && sudo apt update \
  && sudo apt install ngrok -y

sudo service xrdp restart

echo "-----------------------------------"
echo "Xong rồi đại ca ơi! User: hieudz | Pass: 123"
echo "-----------------------------------"
