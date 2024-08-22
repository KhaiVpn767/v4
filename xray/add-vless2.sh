#!/bin/bash
dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
biji=`date +"%Y-%m-%d" -d "$dateFromServer"`
#########################

TIMES="10"
CHATID=$(cat /etc/id)
KEY=$(cat /etc/token)
URL="https://api.telegram.org/bot$KEY/sendMessage"
clear
tls="$(cat ~/log-install.txt | grep -w "Vless Ws Tls" | cut -d: -f2|sed 's/ //g')"
none="$(cat ~/log-install.txt | grep -w "Vless Ws None Tls" | cut -d: -f2|sed 's/ //g')"
NUMBER_OF_CLIENTS=$(grep -c -E "^#vls " "/usr/local/etc/xray/vless.json")
	if [[ ${NUMBER_OF_CLIENTS} == '0' ]]; then
		clear
		echo ""
		echo "You have no existing clients!"
		exit 1
	fi

	clear
	echo ""
	echo "SHOW USER XRAY VLESS WS"
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
export patchtls=/vless
export patchnontls=/vless
export user=$(grep -E "^#vls " "/usr/local/etc/xray/vless.json" | cut -d ' ' -f 2 | sed -n "${CLIENT_NUMBER}"p)
export harini=$(grep -E "^#vls " "/usr/local/etc/xray/vless.json" | cut -d ' ' -f 4 | sed -n "${CLIENT_NUMBER}"p)
export exp=$(grep -E "^#vls " "/usr/local/etc/xray/vless.json" | cut -d ' ' -f 3 | sed -n "${CLIENT_NUMBER}"p)
export uuid=$(grep -E "^#vls " "/usr/local/etc/xray/vless.json" | cut -d ' ' -f 5 | sed -n "${CLIENT_NUMBER}"p)

export vlesslink1="vless://${uuid}@${sts}${domain}:$tls?path=$patchtls&security=tls&encryption=none&type=ws&sni=$sni#${user}"
export vlesslink2="vless://${uuid}@${sts}${domain}:$none?path=$patchnontls&encryption=none&host=$sni&type=ws#${user}"
export vlesslink3="vless://${uuid}@api.useinsider.com:$none?path=$patchnontls&encryption=none&host=${sts}${domain}&type=ws#Server:$creditt-DIGI-APN-${user}"
export vlesslink4="vless://${uuid}@162.159.134.61:$none?path=$patchnontls&encryption=none&host=${sts}${domain}&type=ws#Server:$creditt-DIGI-BOSSTER-${user}"
export vlesslink5="vless://${uuid}@${domain}:$none?path=$patchnontls&encryption=none&host=m.pubgmobile.com&type=ws#Server:$creditt-UMOBILE-FUNZ-${user}"
export vlesslink6="vless://${uuid}@104.17.113.188:$none?path=$patchnontls&encryption=none&host=eurohealthobservatory.who.int.${domain}&type=ws#Server:$creditt-YES-${user}"
export vlesslink7="vless://${uuid}@104.18.203.232:$none?path=$patchnontls&encryption=none&host=www.speedtest.net.${domain}&type=ws#Server:$creditt-SELCOM-0BASIC-${user}"
export vlesslink8="vless://${uuid}@104.17.10.12:$none?path=$patchnontls&encryption=none&host=cdn.who.int.${domain}&type=ws#Server:$creditt-UNIFI-${user}"

systemctl restart xray@vless
systemctl restart xray@vlessnone

clear
echo -e ""
echo -e "\e[$line═════════════════════════════════\e[m"
echo -e "\e[$back_text      \e[30m[\e[$box XRAY VLESS WS\e[30m ]\e[1m          \e[m"
echo -e "\e[$line═════════════════════════════════\e[m"
echo -e "Remarks          : ${user}"
echo -e "Domain           : ${domain}"
echo -e "IP/Host          : $MYIP"
echo -e "Port TLS         : $tls"
echo -e "Port None TLS    : $none"
echo -e "User ID          : ${uuid}"
echo -e "Encryption       : None"
echo -e "Network          : WebSocket"
echo -e "Path Tls         : $patchtls"
echo -e "Path None Tls    : $patchnontls"
echo -e "allowInsecure    : True/allow"
echo -e "\e[$line═════════════════════════════════\e[m"
echo -e "Script By $creditt"
echo -e "\e[$line═════════════════════════════════\e[m"
echo -e "Link TLS         : ${vlesslink1}"
echo -e "\e[$line═════════════════════════════════\e[m"
echo -e "Link None TLS    : ${vlesslink2}"
echo -e "\e[$line═════════════════════════════════\e[m"
echo -e "Link DIGI APN     : ${vlesslink3}"
echo -e "\e[$line═════════════════════════════════\e[m"
echo -e "Link DIGI-BOSSTER : ${vlesslink4}"
echo -e "\e[$line═════════════════════════════════\e[m"
echo -e "Link UMOBILE-FUNZ : ${vlesslink5}"
echo -e "\e[$line═════════════════════════════════\e[m"
echo -e "Link YES          : ${vlesslink6}"
echo -e "\e[$line═════════════════════════════════\e[m"
echo -e "Link SELCOM-0BASIC: ${vlesslink7}"
echo -e "\e[$line═════════════════════════════════\e[m"
echo -e "Link UNIFI        : ${vlesslink8}"
echo -e "\e[$line═════════════════════════════════\e[m"
echo -e "\e[$line══════════════════════\e[m"
echo -e "Name      : ${user}"
echo -e "Created   : $harini"
echo -e "Expired   : $exp"
echo -e "SerVer    : $creditt"
echo -e "\e[$line══════════════════════\e[m"
echo ""
read -p "Enter Back To menu"
menu-vless
