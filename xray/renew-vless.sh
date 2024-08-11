#!/bin/bash
# SL
# ==========================================
# Color
RED='\033[0;31m'
NC='\033[0m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\e[33m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
LIGHT='\033[0;37m'
# ==========================================
# Getting

	clear
	echo "Renew User Xray Vless Ws"
	echo "Select the existing client you want to renew"
	echo " Press CTRL+C to return"
	echo -e "==============================="
	grep -E "^#vls " "/usr/local/etc/xray/vless.json" | cut -d ' ' -f 2-3 | nl -s ') '
	until [[ ${CLIENT_NUMBER} -ge 1 && ${CLIENT_NUMBER} -le ${NUMBER_OF_CLIENTS} ]]; do
		if [[ ${CLIENT_NUMBER} == '1' ]]; then
			read -rp "Select one client [1]: " CLIENT_NUMBER
		else
			read -rp "Select one client [1-${NUMBER_OF_CLIENTS}]: " CLIENT_NUMBER
		fi
	done
read -p "Expired (days): " masaaktif
export harini=$(grep -E "^#vls " "/usr/local/etc/xray/vless.json" | cut -d ' ' -f 4 | sed -n "${CLIENT_NUMBER}"p)
export uuid=$(grep -E "^#vls " "/usr/local/etc/xray/vless.json" | cut -d ' ' -f 5 | sed -n "${CLIENT_NUMBER}"p)
export user=$(grep -E "^#vls " "/usr/local/etc/xray/vless.json" | cut -d ' ' -f 2 | sed -n "${CLIENT_NUMBER}"p)
export exp=$(grep -E "^#vls " "/usr/local/etc/xray/vless.json" | cut -d ' ' -f 3 | sed -n "${CLIENT_NUMBER}"p)
export now=$(date +%Y-%m-%d)
export d1=$(date -d "$exp" +%s)
export d2=$(date -d "$now" +%s)
export exp2=$(( (d1 - d2) / 86400 ))
export exp3=$(($exp2 + $masaaktif))
export exp4=`date -d "$exp3 days" +"%Y-%m-%d"`

sed -i "s/#vls $user $exp $harini $uuid/#vls $user $exp4 $harini $uuid/g" /usr/local/etc/xray/vless.json
sed -i "s/#vls $user $exp $harini $uuid/#vls $user $exp4 $harini $uuid/g" /usr/local/etc/xray/vlessnone.json

systemctl restart xray@vless
systemctl restart xray@vlessnone
service cron restart

clear
echo ""
echo " VLESS WS Account Was Successfully Renewed"
echo -e "\e[$line══════════════════════\e[m"
echo -e "Client Name : $user"
echo -e "Expired On  : $exp4"
echo -e "SerVer      : $creditt"
echo -e "\e[$line══════════════════════\e[m"
echo ""
read -n 1 -s -r -p "Press any key to back on menu xray"
xraay
}
