#!/bin/bash
# //====================================================
# //	System Request:Debian 9+/Ubuntu 18.04+/20+
# //	Author:	YSSHstore
# //	Dscription: Xray Menu Management
# //	email: admin@yogz.com
# //  telegram: https://t.me/khaivpn
# //====================================================
Green="\e[92;1m"
RED="\033[31m"
NC='\033[0m'
OR='\033[1;93m'
ipsaya=$(wget -qO- ipinfo.io/ip)
data_server=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
date_list=$(date +"%Y-%m-%d" -d "$data_server")
data_ip="https://raw.githubusercontent.com/KhaiVpn767/permission/main/ipmini"
ISP=$(cat /etc/xray/isp)
CITY=$(cat /etc/xray/city)
PUB=$(cat /etc/slowdns/server.pub)
NS=$(cat /etc/xray/dns)
domain=$(cat /etc/xray/domain)
checking_sc() {
  useexp=$(wget -qO- $data_ip | grep $ipsaya | awk '{print $3}')
  if [[ $date_list < $useexp ]]; then
    echo -ne
  else
    echo -e "${OR}────────────────────────────────────────────${NC}"
    echo -e "\033[42m            KHAI-VPN AUTOSCRIPT          \033[0m"
    echo -e "${OR}────────────────────────────────────────────${NC}"
    echo -e ""
    echo -e "            ${RED}PERMISSION DENIED !${NC}"
    echo -e "   \033[0;33mYour VPS${NC} $ipsaya \033[0;33mHas been Banned${NC}"
    echo -e "     \033[0;33mBuy access permissions for scripts${NC}"
    echo -e "             \033[0;33mContact Admin :${NC}"
    echo -e "         \033[0;36mTelegram${NC} t.me/khaivpn"
    echo -e "${OR}────────────────────────────────────────────${NC}"
    exit
  fi
}
checking_sc
clear
until [[ $user =~ ^[a-zA-Z0-9_]+$ && ${CLIENT_EXISTS} == '0' ]]; do
  clear
  echo -e "  ${OR}──────────────────────────────────────${NC}"
  printf "\e[1;92m     .::.\e[0m\e[1;77m Add Xray/Vless Account \e[1;92m.::.\e[0m\n"
  echo -e "  ${OR}──────────────────────────────────────${NC}"
  echo ""
  read -rp "  Input Username: " -e user
  CLIENT_EXISTS=$(grep -w $user /etc/xray/config.json | wc -l)

  if [[ ${CLIENT_EXISTS} == '1' ]]; then
    clear
    echo -e "  ${OR}──────────────────────────────────────${NC}"
    printf "\e[1;92m     .::.\e[0m\e[1;77m Add Xray/Vless Account \e[1;92m.::.\e[0m\n"
    echo -e "  ${OR}──────────────────────────────────────${NC}"
    echo ""
    echo "       The customer name already exists"
    echo ""
    echo -e "  ${OR}───────────────────────────────────────${NC}"
    exit

  fi
done

uuid=$(cat /proc/sys/kernel/random/uuid)
sec=2
echo ""
spinner=(⣻ ⢿ ⡿ ⣟ ⣯ ⣷)
while [ $sec -gt 0 ]; do
  echo -ne "\e[33m ${spinner[sec]} Setting up a Premium Account $sec seconds...\r"
  sleep 1
  sec=$(($sec - 1))
done
clear
echo ""
echo -e "\e[1;32m   input dependecies account $user\e[0m\n"
echo -e "\033[0;33m .::.  Script by khaiVPN  .::.\e[0m\n"
echo ""
echo "   Setup Limit Quota/ip for Account"
echo "       0 For Unlimited/No Limit"
echo ""
echo "   Username : $user"
until [[ $masaaktif =~ ^[0-9]+$ ]]; do
  read -p "   Expired (days): " masaaktif
done
until [[ $Quota =~ ^[0-9]+$ ]]; do
  read -p "   Limit User (GB): " Quota
done
until [[ $iplimit =~ ^[0-9]+$ ]]; do
  mkdir -p /etc/kyt/limit/vless/ip
  read -p "   Limit User (IP): " iplimit
done
exp=$(date -d "$masaaktif days" +"%Y-%m-%d")
sed -i '/#vless$/a\#& '"$user $exp"'\
},{"id": "'""$uuid""'","email": "'""$user""'"' /etc/xray/config.json

vlesslink1="vless://${uuid}@${domain}:443?path=/vless&security=tls&encryption=none&type=ws#${user}"
vlesslink2="vless://${uuid}@${domain}:80?path=/vless&encryption=none&type=ws#${user}"
vlesslink3="vless://${uuid}@${domain}:443?mode=gun&security=tls&encryption=none&type=grpc&serviceName=vless-grpc&sni=${domain}#${user}"
vlesslink4="vless://${uuid}@api.useinsider.com:80?path=/vless&encryption=none&host=${sts}${domain}&type=ws#DIGI-APN-${user}"
vlesslink5="vless://${uuid}@162.159.134.61:80?path=/vless&encryption=none&host=${sts}${domain}&type=ws#DIGI-BOSSTER-${user}"
vlesslink6="vless://${uuid}@${domain}:80?path=/vless&encryption=none&host=m.pubgmobile.com&type=ws#UMOBILE-FUNZ-${user}"
vlesslink7="vless://${uuid}@104.17.113.188:80?path=/vless&encryption=none&host=${domain}&type=ws#UMOBILE-${user}"
vlesslink8="vless://${uuid}@104.17.113.188:80?path=/vless&encryption=none&host=eurohealthobservatory.who.int.${domain}&type=ws#YES-${user}"
vlesslink9="vless://${uuid}@104.17.148.22:80?path=/vless&encryption=none&host=www.speedtest.net.${domain}&type=ws#SELCOM-0BASIC-${user}"
vlesslink10="vless://${uuid}@104.17.10.12:80?path=/vless&encryption=none&host=cdn.who.int.${domain}&type=ws#UNIFI-Bebas-${user}"
vlesslink11="vless://${uuid}@speedtest.unifi.com.my.${domain}:80?path=/vless&encryption=none&host=&type=ws#Uni5G-${user}"

cat >/var/www/html/vless-$user.txt <<-END

---------------------
# Format Vless WS (CDN)
---------------------

- name: Vless-$user
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
---------------------
# Format Vless WS (CDN) Non TLS
---------------------
- name: Vless-$user
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
---------------------
#  Format Vless gRPC (SNI)
---------------------
- name: Vless-$user
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
  udp: true

---------------------
# Link Vless Account
---------------------
Link TLS      : 
${vlesslink1}
---------------------
Link none TLS : 
${vlesslink2}
---------------------
Link GRPC     : 
${vlesslink3}
---------------------
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

vlesslink1="vless://${uuid}@${domain}:443?path=/whatever/vless&security=tls&encryption=none&type=ws#${user}"
vlesslink2="vless://${uuid}@${domain}:80?path=/whatever/vless&encryption=none&type=ws#${user}"
vlesslink3="vless://${uuid}@${domain}:443?mode=gun&security=tls&encryption=none&type=grpc&serviceName=vless-grpc&sni=${domain}#${user}-(SNI)-GRPC"
vlesslink4="vless://${uuid}@api.useinsider.com:80?path=/vless&encryption=none&host=${sts}${domain}&type=ws#DIGI-APN-${user}"
vlesslink5="vless://${uuid}@162.159.134.61:80?path=/vless&encryption=none&host=${sts}${domain}&type=ws#DIGI-BOSSTER-${user}"
vlesslink6="vless://${uuid}@${domain}:80?path=/vless&encryption=none&host=m.pubgmobile.com&type=ws#UMOBILE-FUNZ-${user}"
vlesslink7="vless://${uuid}@104.17.113.188:80?path=/vless&encryption=none&host=${domain}&type=ws#UMOBILE-${user}"
vlesslink8="vless://${uuid}@104.17.113.188:80?path=/vless&encryption=none&host=eurohealthobservatory.who.int.${domain}&type=ws#YES-${user}"
vlesslink9="vless://${uuid}@104.17.148.22:80?path=/vless&encryption=none&host=www.speedtest.net.${domain}&type=ws#SELCOM-0BASIC-${user}"
vlesslink10="vless://${uuid}@104.17.10.12:80?path=/vless&encryption=none&host=cdn.who.int.${domain}&type=ws#UNIFI-Bebas-${user}"
vlesslink11="vless://${uuid}@speedtest.unifi.com.my.${domain}:80?path=/vless&encryption=none&host=&type=ws#Uni5G-${user}"
systemctl restart xray
if [ ! -e /etc/vless ]; then
  mkdir -p /etc/vless
fi
if [ -z ${iplimit} ]; then
  iplimit="0"
fi
if [ -z ${Quota} ]; then
  Quota="0"
fi
c=$(echo "${Quota}" | sed 's/[^0-9]*//g')
d=$((${c} * 1024 * 1024 * 1024))
if [[ ${c} != "0" ]]; then
  echo "${d}" >/etc/vless/${user}
  echo "${iplimit}" >/etc/kyt/limit/vless/ip/$user
fi
DATADB=$(cat /etc/vless/.vless.db | grep "^###" | grep -w "${user}" | awk '{print $2}')
if [[ "${DATADB}" != '' ]]; then
  sed -i "/\b${user}\b/d" /etc/vless/.vless.db
fi
echo "### ${user} ${exp} ${uuid} ${Quota} ${iplimit}" >>/etc/vless/.vless.db

clear -x
echo -e "${OR}───────────────────────────${NC}" | tee -a /etc/xray/log-create-${user}.log
echo -e "\e[92;1m    Xray/Vless Account    \E[0m" | tee -a /etc/xray/log-create-${user}.log
echo -e "${OR}───────────────────────────${NC}" | tee -a /etc/xray/log-create-${user}.log
echo -e "Remarks        : ${user}" | tee -a /etc/xray/log-create-${user}.log
#echo -e "CITY           : ${CITY}" | tee -a /etc/xray/log-create-${user}.log
#echo -e "ISP            : ${ISP}" | tee -a /etc/xray/log-create-${user}.log
echo -e "Domain         : ${domain}" | tee -a /etc/xray/log-create-${user}.log
echo -e "Port TLS       : 443" | tee -a /etc/xray/log-create-${user}.log
echo -e "Port none TLS  : 80, 8080" | tee -a /etc/xray/log-create-${user}.log
echo -e "id             : ${uuid}" | tee -a /etc/xray/log-create-${user}.log
echo -e "network        : ws or grpc" | tee -a /etc/xray/log-create-${user}.log
echo -e "path           : /vless " | tee -a /etc/xray/log-create-${user}.log
echo -e "servicename    : vless-grpc" | tee -a /etc/xray/log-create-${user}.log
echo -e "${OR}☉───────────────────────────☉${NC}" | tee -a /etc/xray/log-create-${user}.log
echo -e "Link TLS  : ${vlesslink1}" | tee -a /etc/xray/log-create-${user}.log
echo -e "${OR}☉───────────────────────────☉${NC}" | tee -a /etc/xray/log-create-${user}.log
echo -e "Link NTLS : ${vlesslink2}" | tee -a /etc/xray/log-create-${user}.log
echo -e "${OR}☉───────────────────────────☉${NC}" | tee -a /etc/xray/log-create-${user}.log
echo -e "Link GRPC : ${vlesslink3}" | tee -a /etc/xray/log-create-${user}.log
echo -e "${OR}☉───────────────────────────☉${NC}" | tee -a /etc/xray/log-create-${user}.log
echo -e "Link DIGI-APN : ${vlesslink4}" | tee -a /etc/xray/log-create-${user}.log
echo -e "${OR}☉───────────────────────────☉${NC}" | tee -a /etc/xray/log-create-${user}.log
echo -e "Link DIGI-BOSSTER : ${vlesslink5}" | tee -a /etc/xray/log-create-${user}.log
echo -e "${OR}☉───────────────────────────☉${NC}" | tee -a /etc/xray/log-create-${user}.log
echo -e "Link Umobile-funz : ${vlesslink6}" | tee -a /etc/xray/log-create-${user}.log
echo -e "${OR}☉───────────────────────────☉${NC}" | tee -a /etc/xray/log-create-${user}.log
echo -e "Link UMOBILE : ${vlesslink7}" | tee -a /etc/xray/log-create-${user}.log
echo -e "${OR}☉───────────────────────────☉${NC}" | tee -a /etc/xray/log-create-${user}.log
echo -e "Link YES : ${vlesslink8}" | tee -a /etc/xray/log-create-${user}.log
echo -e "${OR}☉───────────────────────────☉${NC}" | tee -a /etc/xray/log-create-${user}.log
echo -e "Link SELCOM-0BASIC : ${vlesslink9}" | tee -a /etc/xray/log-create-${user}.log
echo -e "${OR}☉───────────────────────────☉${NC}" | tee -a /etc/xray/log-create-${user}.log
echo -e "Link UNIFI-Bebas : ${vlesslink10}" | tee -a /etc/xray/log-create-${user}.log
echo -e "${OR}☉──────────────────────────☉${NC}" | tee -a /etc/xray/log-create-${user}.log
echo -e "Link UNIFI-Uni5G : ${vlesslink11}" | tee -a /etc/xray/log-create-${user}.log
echo -e "${OR}☉───────────────────────────☉${NC}" | tee -a /etc/xray/log-create-${user}.log
echo -e "Format OpenClash : https://${domain}:81/vless-$user.txt" | tee -a /etc/xray/log-create-${user}.log
echo -e "${OR}☉───────────────────────────☉${NC}" | tee -a /etc/xray/log-create-${user}.log
echo -e "\033[1;93m☉———————————————————☉\033[0m" | tee -a /etc/xray/log-create-${user}.log
echo -e "Remarks        : ${user}" | tee -a /etc/xray/log-create-${user}.log
echo -e "Aktif Selama   : $masaaktif Hari" | tee -a /etc/xray/log-create-${user}.log
echo -e "Dibuat Pada    : $tnggl" | tee -a /etc/xray/log-create-${user}.log
echo -e "Berakhir Pada  : $expe" | tee -a /etc/xray/log-create-${user}.log
echo -e "\033[1;93m☉———————————————————☉\033[0m" | tee -a /etc/xray/log-create-${user}.log
echo ""
read -p "Enter Back To menu"
menu-vless
