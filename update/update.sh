#!/bin/bash
#clear
echo -e "Downloading Update File"
sleep 2
wget -q -O /usr/bin/menu "https://raw.githubusercontent.com/rizkyckj/rvpnstores/master/menu/menu.sh" && chmod +x /usr/bin/menu
wget https://raw.githubusercontent.com/rizkyckj/rvpnstores/master/xray/cek-tr.sh
wget https://raw.githubusercontent.com/rizkyckj/rvpnstores/master/xray/cek-ws.sh
sleep 2
