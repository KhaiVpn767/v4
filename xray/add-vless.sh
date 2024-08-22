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

vlesslink1="vless://${uuid}@${domain}:443?path=/vless&security=tls&encryption=none&type=ws#${user}"
vlesslink2="vless://${uuid}@${domain}:80?path=/vless&encryption=none&type=ws#${user}"
vlesslink3="vless://${uuid}@${domain}:443?mode=gun&security=tls&encryption=none&type=grpc&serviceName=vless-grpc&sni=${domain}#${user}"
vlesslink4="vless://${uuid}@api.useinsider.com:80?path=/vless&encryption=none&host=${sts}${domain}&type=ws#Server:$creditt-DIGI-APN-${user}"
vlesslink5="vless://${uuid}@162.159.134.61:80?path=/vless&encryption=none&host=${sts}${domain}&type=ws#Server:$creditt-DIGI-BOSSTER-${user}"
vlesslink6="vless://${uuid}@${domain}:80?path=/vless&encryption=none&host=m.pubgmobile.com&type=ws#Server:$creditt-UMOBILE-FUNZ-${user}"
vlesslink7="vless://${uuid}@104.17.113.188:80?path=/vless&encryption=none&host=eurohealthobservatory.who.int.${domain}&type=ws#Server:$creditt-YES-${user}"
vlesslink8="vless://${uuid}@104.17.148.22:80?path=/vless&encryption=none&host=www.speedtest.net.${domain}&type=ws#Server:$creditt-SELCOM-0BASIC-${user}"
vlesslink9="vless://${uuid}@104.17.10.12:80?path=/vless&encryption=none&host=cdn.who.int.${domain}&type=ws#Server:$creditt-UNIFI-Bebas-${user}"
vlesslink10="vless://${uuid}@speedtest.unifi.com.my.${domain}:80?path=/vless&encryption=none&host=&type=ws#Server:$creditt-Uni5G-${user}"


systemctl restart xray@vless
systemctl restart xray@vlessnone

◇━━━━━━━━━━━━━━━━━◇
   Format For Clash
◇━━━━━━━━━━━━━━━━━◇
# Format Vless WS TLS

- name: Vless-$user-WS TLS
  server: ${domain}
  port: 443
  type: vless
  uuid: ${uuid}
  cipher: auto
  tls: true
  skip-cert-verify: true
  servername: ${domain}
  network: ws
  ws-opts:
    path: /vless
    headers:
      Host: ${domain}

# Format Vless WS Non TLS

- name: Vless-$user-WS (CDN) Non TLS
  server: ${domain}
  port: 80
  type: vless
  uuid: ${uuid}
  cipher: auto
  tls: false
  skip-cert-verify: false
  servername: ${domain}
  network: ws
  ws-opts:
    path: /vless
    headers:
      Host: ${domain}
  udp: true

# Format Vless gRPC (SNI)

- name: Vless-$user-gRPC (SNI)
  server: ${domain}
  port: 443
  type: vless
  uuid: ${uuid}
  cipher: auto
  tls: true
  skip-cert-verify: true
  servername: ${domain}
  network: grpc
  grpc-opts:
  grpc-mode: gun
    grpc-service-name: vless-grpc

◇━━━━━━━━━━━━━━━━━◇
Link Akun Vless 
◇━━━━━━━━━━━━━━━━━◇
Link TLS      : 
${vlesslink1}
◇━━━━━━━━━━━━━━━━━◇
Link none TLS : 
${vlesslink2}
◇━━━━━━━━━━━━━━━━━◇
Link GRPC     : 
${vlesslink3}
◇━━━━━━━━━━━━━━━━━◇
Link none TLS : 
${vlesslink4}
◇━━━━━━━━━━━━━━━━━◇
Link none TLS : 
${vlesslink5}
◇━━━━━━━━━━━━━━━━━◇
Link none TLS : 
${vlesslink6}
◇━━━━━━━━━━━━━━━━━◇
Link none TLS : 
${vlesslink7}
◇━━━━━━━━━━━━━━━━━◇
Link none TLS : 
${vlesslink8}
◇━━━━━━━━━━━━━━━━━◇
Link none TLS : 
${vlesslink9}
◇━━━━━━━━━━━━━━━━━◇
Link none TLS : 
${vlesslink10}
◇━━━━━━━━━━━━━━━━━◇


END

systemctl restart xray
systemctl restart nginx
clear
echo -e ""
echo -e "\033[1;93m☉————————————————————————☉\033[0m"
echo -e "🧿Status Create VLESS Succes🧿           "
echo -e "\033[1;93m☉————————————————————————☉\033[0m"
echo -e "Remarks     : ${user}"
echo -e "Domain      : ${domain}"
#echo -e "User Quota  : ${Quota} GB"
echo -e "User Ip       : ${iplimit} IP"
echo -e "port TLS    : 400-900"
#echo -e "Port DNS    : 443" | tee -a /etc/user-create/user.log
echo -e "Port NTLS   : 80, 8080, 8880, 2082"
echo -e "User ID     : ${uuid}"
#echo -e "Xray Dns.   : ${NS}" | tee -a /etc/user-create/user.log
#echo -e "Pubkey.     : ${PUB}" | tee -a /etc/user-create/user.log
echo -e "Encryption  : none"
echo -e "Path TLS    : /vless/multi-path "
echo -e "ServiceName : vless-grpc"
echo -e "\033[1;93m☉————————————————————————☉\033[0m"
echo -e "Link TLS    : ${vlesslink1}"
echo -e "\033[1;93m☉————————————————————————☉\033[0m"
echo -e "Link NTLS   : ${vlesslink2}"
echo -e "\033[1;93m☉————————————————————————☉\033[0m"
echo -e "Link GRPC   : ${vlesslink3}"
echo -e "\033[1;93m☉————————————————————————☉\033[0m"
echo -e "Link DIGI-APN    : ${vlesslink4}"
echo -e "\033[1;93m☉————————————————————————☉\033[0m"
echo -e "Link DIGI-BOSSTER: ${vlesslink5}"
echo -e "\033[1;93m☉————————————————————————☉\033[0m"
echo -e "Link Umobile-funz: ${vlesslink6}"
echo -e "\033[1;93m☉————————————————————————☉\033[0m"
echo -e "Link YES.        : ${vlesslink7}"
echo -e "\033[1;93m☉————————————————————————☉\033[0m"
echo -e "Link SELCOM-0BASIC: ${vlesslink8}"
echo -e "\033[1;93m☉————————————————————————☉\033[0m"
echo -e "Link UNIFI-Bebas. : ${vlesslink9}"
echo -e "\033[1;93m☉————————————————————————☉\033[0m"
echo -e "Link UNIFI-Uni5G. : ${vlesslink10}"
echo -e "\033[1;93m☉————————————————————————☉\033[0m"
echo -e "Format OpenClash : https://${domain}:81/vless-$user.txt"
echo -e "\033[1;93m☉————————————————————————☉\033[0m"
echo -e "\033[1;93m☉———————————————————☉\033[0m"
echo -e "Remarks            : ${user}"
echo -e "Aktif Selama     : $masaaktif Hari"
echo -e "Dibuat Pada      : $tnggl"
echo -e "Berakhir Pada    : $expe"
echo -e "\033[1;93m☉———————————————————☉\033[0m"
echo ""
read -p "Enter Back To menu"
menu-vless
