#!/bin/bash
# cari apa
# harta tahta hanya sementara ingat masih ada kehidupan setelah kematian
# jangan lupa sholat
clear
IP=$(wget -qO- ipinfo.io/ip);
domain=$(cat /etc/xray/domain)
date=$(date +"%Y-%m-%d")
red='\e[1;31m'
green='\e[0;32m'
yell='\e[1;33m'
tyblue='\e[1;36m'
BRed='\e[1;31m'
BGreen='\e[1;32m'
BYellow='\e[1;33m'
BBlue='\e[1;34m'
NC='\e[0m'
purple() { echo -e "\\033[35;1m${*}\\033[0m"; }
tyblue() { echo -e "\\033[36;1m${*}\\033[0m"; }
yellow() { echo -e "\\033[33;1m${*}\\033[0m"; }
green() { echo -e "\\033[32;1m${*}\\033[0m"; }
red() { echo -e "\\033[31;1m${*}\\033[0m"; }
cd /root
#System version number
if [ "${EUID}" -ne 0 ]; then
		echo "You need to run this script as root"
		exit 1
fi
if [ "$(systemd-detect-virt)" == "openvz" ]; then
		echo "OpenVZ is not supported"
		exit 1
fi

localip=$(hostname -I | cut -d\  -f1)
hst=( `hostname` )
dart=$(cat /etc/hosts | grep -w `hostname` | awk '{print $2}')
if [[ "$hst" != "$dart" ]]; then
echo "$localip $(hostname)" >> /etc/hosts
fi
# buat folder
mkdir -p /etc/xray
mkdir -p /etc/v2ray
mkdir /etc/funny
mkdir /etc/funny/limit
mkdir /etc/funny/limit/trojan
mkdir /etc/funny/limit/vless
mkdir /etc/funny/limit/vmess
mkdir /etc/funny/limit/ssh
mkdir /etc/funny/limit/ssh/ip
mkdir /etc/funny/limit/trojan/ip
mkdir /etc/funny/limit/trojan/quota
mkdir /etc/funny/limit/vless/ip
mkdir /etc/funny/limit/vless/quota
mkdir /etc/funny/limit/vmess/ip
mkdir /etc/funny/limit/vmess/quota
mkdir /etc/funny/trojan
mkdir /etc/funny/vless
mkdir /etc/funny/vmess
mkdir /etc/funny/log
mkdir /etc/funny/log/trojan
mkdir /etc/funny/log/vless
mkdir /etc/funny/log/vmess
mkdir /etc/funny/log/ssh
mkdir /etc/funny/cache
mkdir /etc/funny/cache/trojan-tcp
mkdir /etc/funny/cache/trojan-ws
mkdir /etc/funny/cache/trojan-grpc
mkdir /etc/funny/cache/vless-ws
mkdir /etc/funny/cache/vless-grpc
mkdir /etc/funny/cache/vmess-ws
mkdir /etc/funny/cache/vmess-grpc
mkdir /etc/funny/cache/vmess-ws-orbit
mkdir /etc/funny/cache/vmess-ws-orbit1
touch /etc/xray/domain
touch /etc/v2ray/domain
touch /etc/xray/scdomain
touch /etc/v2ray/scdomain


echo -e "[ ${BBlue}NOTES${NC} ] Before we go.. "
sleep 0.5
echo -e "[ ${BBlue}NOTES${NC} ] I need check your headers first.."
sleep 0.5
echo -e "[ ${BGreen}INFO${NC} ] Checking headers"
sleep 0.5
totet=`uname -r`
REQUIRED_PKG="linux-headers-$totet"
PKG_OK=$(dpkg-query -W --showformat='${Status}\n' $REQUIRED_PKG|grep "install ok installed")
echo Checking for $REQUIRED_PKG: $PKG_OK
if [ "" = "$PKG_OK" ]; then
  sleep 0.5
  echo -e "[ ${BRed}WARNING${NC} ] Try to install ...."
  echo "No $REQUIRED_PKG. Setting up $REQUIRED_PKG."
  apt-get --yes install $REQUIRED_PKG
  sleep 0.5
  echo ""
  sleep 0.5
  echo -e "[ ${BBlue}NOTES${NC} ] If error you need.. to do this"
  sleep 0.5
  echo ""
  sleep 0.5
  echo -e "[ ${BBlue}NOTES${NC} ] apt update && apt upgrade -y && reboot"
  sleep 0.5
  echo ""
  sleep 0.5
  echo -e "[ ${BBlue}NOTES${NC} ] After this"
  sleep 0.5
  echo -e "[ ${BBlue}NOTES${NC} ] Then run this script again"
  echo -e "[ ${BBlue}NOTES${NC} ] enter now"
  read
else
  echo -e "[ ${BGreen}INFO${NC} ] Oke installed"
fi

ttet=`uname -r`
ReqPKG="linux-headers-$ttet"
if ! dpkg -s $ReqPKG  >/dev/null 2>&1; then
  rm /root/setup.sh >/dev/null 2>&1 
  exit
else
  clear
fi


secs_to_human() {
    echo "Installation time : $(( ${1} / 3600 )) hours $(( (${1} / 60) % 60 )) minute's $(( ${1} % 60 )) seconds"
}
start=$(date +%s)
ln -fs /usr/share/zoneinfo/Asia/Jakarta /etc/localtime
sysctl -w net.ipv6.conf.all.disable_ipv6=1 >/dev/null 2>&1
sysctl -w net.ipv6.conf.default.disable_ipv6=1 >/dev/null 2>&1

echo -e "[ ${BGreen}INFO${NC} ] Preparing the install file"
apt install git curl -y >/dev/null 2>&1
apt install python -y >/dev/null 2>&1
echo -e "[ ${BGreen}INFO${NC} ] Aight good ... installation file is ready"
sleep 0.5
echo -ne "[ ${BGreen}INFO${NC} ] Check permission : "
url_izin='https://raw.githubusercontent.com/rizkyckj/izinip/master/ip'

#IP VPS
ip_vps=$(curl -sS ifconfig.me)

# Mendapatkan isi file izin.txt dari URL
izin=$(curl -s "$url_izin")

# Memeriksa apakah konten izin.txt berhasil didapatkan
if [[ -n "$izin" ]]; then
  while IFS= read -r line; do
    # Memisahkan nama VPS, IP VPS, dan tanggal kadaluwarsa
    nama=$(echo "$line" | awk '{print $1}')
    ipvps=$(echo "$line" | awk '{print $2}')
    tanggal=$(echo "$line" | awk '{print $3}')

    # Memeriksa apakah IP VPS saat ini cocok dengan IP VPS yang ada di izin.txt
    if [[ "$ipvps" == "$ip_vps" ]]; then
      echo "Nama VPS: $nama"
      echo "IP VPS: $ipvps"
      echo "Tanggal Kadaluwarsa: $tanggal"
      break
    fi
  done <<< "$izin"

  # Memeriksa apakah IP VPS ditemukan dalam izin.txt
  if [[ "$ipvps" != "$ip_vps" ]]; then
    echo "IP VPS tidak ditemukan dalam izin.txt"
    exit 0
  fi
else
  echo "Konten izin.txt tidak berhasil didapatkan dari URL"
  exit 0
fi

echo -e "$BGreen Permission Accepted!$NC"
sleep 2

mkdir -p /var/lib/ >/dev/null 2>&1
echo "IP=" >> /var/lib/ipvps.conf

echo ""
clear

    
#link izin ip vps
url_izin='https://raw.githubusercontent.com/rizkyckj/izinip/master/ip'
# Mendapatkan IP VPS saat ini
ip_vps=$(curl -s ifconfig.me)
# Mendapatkan isi file izin.txt dari URL
izin=$(curl -s "$url_izin")
#install limit
wget https://raw.githubusercontent.com/rizkyckj/rvpnstores/master/funny/quota
wget https://raw.githubusercontent.com/rizkyckj/rvpnstores/master/funny/quota-trojan-grpc
wget https://raw.githubusercontent.com/rizkyckj/rvpnstores/master/funny/quota-trojan-tcp
wget https://raw.githubusercontent.com/rizkyckj/rvpnstores/master/funny/quota-trojan-ws
wget https://raw.githubusercontent.com/rizkyckj/rvpnstores/master/funny/quota-vmess-grpc
wget https://raw.githubusercontent.com/rizkyckj/rvpnstores/master/funny/quota-vmess-ws
wget https://raw.githubusercontent.com/rizkyckj/rvpnstores/master/funny/quota-vless-ws
wget https://raw.githubusercontent.com/rizkyckj/rvpnstores/master/funny/quota-vless-grpc
wget https://raw.githubusercontent.com/rizkyckj/rvpnstores/master/funny/quota-vmess-ws-orbit
wget https://raw.githubusercontent.com/rizkyckj/rvpnstores/master/funny/quota-vmess-ws-orbit1
wget https://raw.githubusercontent.com/rizkyckj/rvpnstores/master/funny/limit
wget https://raw.githubusercontent.com/rizkyckj/rvpnstores/master/funny/limit-ip-ssh
wget https://raw.githubusercontent.com/rizkyckj/rvpnstores/master/funny/limit-ip-trojan
wget https://raw.githubusercontent.com/rizkyckj/rvpnstores/master/funny/limit-ip-vless
wget https://raw.githubusercontent.com/rizkyckj/rvpnstores/master/funny/limit-ip-vmess
wget https://raw.githubusercontent.com/rizkyckj/rvpnstores/master/funny/limit-quota-trojan
wget https://raw.githubusercontent.com/rizkyckj/rvpnstores/master/funny/limit-quota-vmess
wget https://raw.githubusercontent.com/rizkyckj/rvpnstores/master/funny/limit-quota-vless
wget https://raw.githubusercontent.com/rizkyckj/rvpnstores/master/funny/list-ssh
wget https://raw.githubusercontent.com/rizkyckj/rvpnstores/master/funny/list-vmess
wget https://raw.githubusercontent.com/rizkyckjrvpnstoressl/master/funny/list-vless
wget https://raw.githubusercontent.com/rizkyckj/rvpnstores/master/funny/list-trojan
wget https://raw.githubusercontent.com/rizkyckj/rvpnstores/master/funny/log-ssh
wget https://raw.githubusercontent.com/rizkyckj/rvpnstores/master/funny/log-vmess
wget https://raw.githubusercontent.com/rizkyckj/rvpnstores/master/funny/log-vless
wget https://raw.githubusercontent.com/rizkyckj/rvpnstores/master/funny/log-trojan
wget https://raw.githubusercontent.com/rizkyckj/rvpnstores/master/funny/loop
wget https://raw.githubusercontent.com/rizkyckj/rvpnstores/master/funny/matikan
wget https://raw.githubusercontent.com/rizkyckj/rvpnstores/master/funny/cek-ssh
wget https://raw.githubusercontent.com/rizkyckj/rvpnstores/master/funny/cek-trojan
wget https://raw.githubusercontent.com/rizkyckj/rvpnstores/master/funny/cek-vless
wget https://raw.githubusercontent.com/rizkyckj/rvpnstores/master/funny/cek-vmess
chmod +x *
#install ssh ovpn
echo -e "\e[33m-----------------------------------\033[0m"
echo -e "$BGreen      Install SSH Websocket           $NC"
echo -e "\e[33m-----------------------------------\033[0m"
sleep 0.5
clear
wget https://raw.githubusercontent.com/rizkyckj/rvpnstores/master/ssh/ssh-vpn.sh && chmod +x ssh-vpn.sh && ./ssh-vpn.sh
#UDP CUSTOM
sleep 0.5
clear
wget https://raw.githubusercontent.com/Rerechan02/UDP/main/udp.sh && chmod +x udp.sh && ./udp.sh
#install Xray 
echo -e "\e[33m-----------------------------------\033[0m"
echo -e "$BGreen          Install XRAY              $NC"
echo -e "\e[33m-----------------------------------\033[0m"
sleep 0.5
clear
wget https://raw.githubusercontent.com/rizkyckj/rvpnstores/master/xray/ins-xray.sh && chmod +x ins-xray.sh && ./ins-xray.sh
wget https://raw.githubusercontent.com/rizkyckj/rvpnstores/master/sshws/insshws.sh && chmod +x insshws.sh && ./insshws.sh
#Download Extra Menu
echo -e "\e[33m-----------------------------------\033[0m"
echo -e "$BGreen        DOWNLOAD EXTRA MENU              $NC"
echo -e "\e[33m-----------------------------------\033[0m"
sleep 0.5
clear
wget https://raw.githubusercontent.com/rizkyckj/rvpnstores/master/update/update.sh && chmod +x update.sh && ./update.sh
clear
cat> /root/.profile << END
# ~/.profile: executed by Bourne-compatible login shells.

if [ "$BASH" ]; then
  if [ -f ~/.bashrc ]; then
    . ~/.bashrc
  fi
fi

mesg n || true
clear
menu
END
chmod 644 /root/.profile

if [ -f "/root/log-install.txt" ]; then
rm /root/log-install.txt > /dev/null 2>&1
fi
if [ -f "/etc/afak.conf" ]; then
rm /etc/afak.conf > /dev/null 2>&1
fi
if [ ! -f "/etc/log-create-ssh.log" ]; then
echo "Log SSH Account " > /etc/log-create-ssh.log
fi
if [ ! -f "/etc/log-create-vmess.log" ]; then
echo "Log Vmess Account " > /etc/log-create-vmess.log
fi
if [ ! -f "/etc/log-create-vless.log" ]; then
echo "Log Vless Account " > /etc/log-create-vless.log
fi
if [ ! -f "/etc/log-create-trojan.log" ]; then
echo "Log Trojan Account " > /etc/log-create-trojan.log
fi
if [ ! -f "/etc/log-create-shadowsocks.log" ]; then
echo "Log Shadowsocks Account " > /etc/log-create-shadowsocks.log
fi
history -c
serverV=$( curl -sS https://raw.githubusercontent.com/rizkyckj/rvpnstores/master/menu/versi  )
echo $serverV > /opt/.ver
aureb=$(cat /home/re_otm)
b=11
if [ $aureb -gt $b ]
then
gg="PM"
else
gg="AM"
fi
curl -sS ipv4.icanhazip.com > /etc/myipvps
echo ""
echo "==========================="  | tee -a log-install.txt
echo "IP VPS :$ip_vps"
echo "SCRIPT BY RVPN PREMIUM"
echo "DATE :$DATE2"
echo "============================" | tee e -a log-install.txt
echo -e ""
echo ""
echo "" | tee -a log-install.txt
rm /root/setup.sh >/dev/null 2>&1
rm /root/ins-xray.sh >/dev/null 2>&1
rm /root/insshws.sh >/dev/null 2>&1
secs_to_human "$(($(date +%s) - ${start}))" | tee -a log-install.txt
echo -e ""
echo " Auto reboot in 10 Seconds "
sleep 10
rm -f setup.sh
reboot

