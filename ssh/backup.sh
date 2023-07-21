#!/bin/bash
dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
biji=`date +"%Y-%m-%d" -d "$dateFromServer"`
###########- COLOR CODE -##############
NC="\e[0m"
RED="\033[0;31m" 
      
###########- END COLOR CODE -##########
clear
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e "$COLOR1│${NC} ${COLBG1}             • BACKUP PANEL MENU •             ${NC} $COLOR1│$NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e "$COLOR1│${NC}  [INFO] Create password for database"
read -rp "   [INFO] Enter password : " -e InputPass
sleep 1
if [[ -z $InputPass ]]; then
exit 0
fi
echo -e "$COLOR1│${NC}  [INFO] Processing... "
mkdir -p /root/backup
sleep 2

cp /etc/passwd /root/backup/ &> /dev/null
cp -r /etc/xray /root/backup/xray &> /dev/null
cp -r /etc/trojan-go /root/backup/trojan-go &> /dev/null
cd /root
zip -rP $InputPass $nama.zip backup > /dev/null 2>&1

##############++++++++++++++++++++++++#############
LLatest=`date`
Get_Data () {
git clone https://github.com/Rerechan02/backup.git /root/user-backup/ &> /dev/null
}

Mkdir_Data () {
mkdir -p /root/user-backup/$nama
}

Input_Data_Append () {
if [ ! -f "/root/user-backup/$nama/$nama-last-backup" ]; then
touch /root/user-backup/$nama/$nama-last-backup
fi
echo -e "User         : $nama
last-backup : $LLatest
" >> /root/user-backup/$nama/$nama-last-backup
mv /root/$nama.zip /root/user-backup/$nama/
}

Save_And_Exit () {
    DATE=$(date +'%d %B %Y')
    cd /root/user-backup
    git config --global user.email "riskifadilah3375@gmail.com" &> /dev/null
    git config --global user.name "Rerechan02" &> /dev/null
    rm -rf .git &> /dev/null
    git init &> /dev/null
    git add . &> /dev/null
    git commit -m backup &> /dev/null
    git branch -M main &> /dev/null
    git remote add origin https://github.com/Rerechan02/backup
    git push -f https://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@github.com/Rerechan02/backup.git &> /dev/null
}

if [ ! -d "/root/user-backup/" ]; then
sleep 1
echo -e "$COLOR1│${NC}  [INFO] Getting database... "
Get_Data
Mkdir_Data
sleep 1
echo -e "$COLOR1│${NC}  [INFO] Getting info server... "
Input_Data_Append
sleep 1
echo -e "$COLOR1│${NC}  [INFO] Processing updating server...... "
Save_And_Exit
fi
link="https://raw.githubusercontent.com/Rerechan02/backup/main/$nama/$nama.zip"
sleep 1
echo -e "$COLOR1│${NC}  [INFO] Backup done "
sleep 1
echo
sleep 1
echo -e "$COLOR1│${NC}  [INFO] Generete Link Backup "
echo -e "$COLOR1│${NC}"
sleep 2
echo -e "$COLOR1│${NC}  The following is a link to your vps data backup file.
$COLOR1│${NC}  Your VPS IP $IP
$COLOR1│${NC}
$COLOR1│${NC}  $link
$COLOR1│${NC}  save the link pliss!
$COLOR1│${NC}
$COLOR1│${NC}  If you want to restore data, please enter the link above.
$COLOR1│${NC}  Thank You For Using Our Services"
cd
rm -rf /root/backup &> /dev/null
rm -rf /root/user-backup &> /dev/null
rm -f /root/$nama.zip &> /dev/null
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}" 
echo ""
read -n 1 -s -r -p "   Press any key to back on menu"
menu
