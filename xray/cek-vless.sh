#!/bin/bash
# My Telegram : https://t.me/owner-khaivpn
# ==========================================
# Color
RED='\033[0;31m'
NC='\033[0m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
LIGHT='\033[0;37m'
# ==========================================
# Getting

clear
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
echo -e "${BIYellow} ═════════════════════════════════\e[m"
echo -e "\e[$back_text      \e[30m[\e[$box XRAY VLESS WS\e[30m ]\e[1m          \e[m"
echo -e "${BIYellow} ═════════════════════════════════\e[m"
echo -e "${BIYellow} Remarks          : ${user}"
echo -e "${BIYellow}Domain           : ${domain}"
echo -e "${BIYellow}IP/Host          : $MYIP"
echo -e "${BIYellow}Port TLS         : $tls"
echo -e "${BIYellow}Port None TLS    : $none"
echo -e "${BIYellow}User ID          : ${uuid}"
echo -e "${BIYellow}Encryption       : None"
echo -e "${BIYellow}Network          : WebSocket"
echo -e "${BIYellow}Path Tls         : $patchtls"
echo -e "${BIYellow}Path None Tls    : $patchnontls"
echo -e "${BIYellow}allowInsecure    : True/allow"
echo -e "${BIYellow}${BIYellow} ═════════════════════════════════\e[m"
echo -e "${BIYellow}Script By $creditt"
echo -e "${BIYellow} ═════════════════════════════════\e[m"
echo -e "${BIYellow}Link TLS         : ${vlesslink1}"
echo -e "${BIYellow} ═════════════════════════════════\e[m"
echo -e "${BIYellow}Link None TLS    : ${vlesslink2}"
echo -e "${BIYellow} ═════════════════════════════════\e[m"
echo -e "${BIYellow}Link DIGI APN     : ${vlesslink3}"
echo -e "${BIYellow} ═════════════════════════════════\e[m"
echo -e "${BIYellow}Link DIGI-BOSSTER : ${vlesslink4}"
echo -e "${BIYellow} ═════════════════════════════════\e[m"
echo -e "${BIYellow}Link UMOBILE-FUNZ : ${vlesslink5}"
echo -e "${BIYellow} ═════════════════════════════════\e[m"
echo -e "${BIYellow}Link YES          : ${vlesslink6}"
echo -e "${BIYellow} ═════════════════════════════════\e[m"
echo -e "${BIYellow}Link SELCOM-0BASIC: ${vlesslink7}"
echo -e "${BIYellow} ═════════════════════════════════\e[m"
echo -e "${BIYellow}Link UNIFI        : ${vlesslink8}"
echo -e "${BIYellow} ═════════════════════════════════\e[m"
echo -e "${BIYellow} ══════════════════════\e[m"
echo -e "${BIYellow}Name      : ${user}"
echo -e "Created   : $harini"
echo -e "${BIYellow}Expired   : $exp"
echo -e "${BIYellow}SerVer    : $creditt"
echo -e "${BIYellow} ══════════════════════\e[m"
echo ""
echo ""
read -n 1 -s -r -p "Press any key to back on menu xray"
menu-vless
}
