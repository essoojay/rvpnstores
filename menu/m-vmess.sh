#!/bin/bash
MYIP=$(wget -qO- ipv4.icanhazip.com);
echo "Checking VPS"
vlx=$(grep -c -e "^#& " "/etc/xray/config.json")
let vla=$vlx/2
vmc=$(grep -c -e "^### " "/etc/xray/config.json")
let vma=$vmc/2
trx=$(grep -c -E "^#! " "/etc/xray/config.json")
let tra=$trx/2
ssx=$(grep -c -E "### " "/etc/trojan-go/akun.conf")
let ssa=$ssx/2
clear
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
eecho -e "      VMESS          TROJAN          VLESS"
echo -e "       $vma           $tra            $vla"                      
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e ""
echo -e " [\e[36m•1\e[0m] Create Account Vmess "
echo -e " [\e[36m•2\e[0m] Trial Account Vmess "
echo -e " [\e[36m•3\e[0m] Extending Account Vmess "
echo -e " [\e[36m•4\e[0m] Delete Account Vmess "
echo -e " [\e[36m•5\e[0m] Check User Login Vmess "
echo -e " [\e[36m•6\e[0m] User list created Account "
echo -e ""
echo -e " [\e[31m•0\e[0m] \e[31mBACK TO MENU\033[0m"
echo -e ""
echo -e   "Press x or [ Ctrl+C ] • To-Exit"
echo ""
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e ""
read -p " Select menu :  "  opt
echo -e ""
case $opt in
1) clear ; add-ws ; exit ;;
2) clear ; trialvmess ; exit ;;
3) clear ; renew-ws ; exit ;;
4) clear ; del-ws ; exit ;;
5) clear ; cek-ws ; exit ;;
6) clear ; cat /etc/log-create-vmess.log ; exit ;;
0) clear ; menu ; exit ;;
x) exit ;;
*) echo "Anda salah tekan " ; sleep 1 ; m-sshovpn ;;
esac
