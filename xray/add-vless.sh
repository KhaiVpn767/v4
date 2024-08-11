#!/bin/bash
dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
biji=`date +"%Y-%m-%d" -d "$dateFromServer"`
#########################

TIMES="10"
CHATID=$(cat /etc/id)
KEY=$(cat /etc/token)
URL="https://api.telegram.org/bot$KEY/sendMessage"


clear

domain=$(cat /etc/xray/domain)
clear
until [[ $user =~ ^[a-zA-Z0-9_]+$ && ${CLIENT_EXISTS} == '0' ]]; do
  echo -e "\033[1;93m☉————————————————————————☉\033[0m"
  echo -e " CREATE VLESS ACCOUNT           "
  echo -e "\033[1;93m☉————————————————————————☉\033[0m"

  read -rp "User: " -e user
  CLIENT_EXISTS=$(grep -w $user /etc/xray/config.json | wc -l)

  if [[ ${CLIENT_EXISTS} == '1' ]]; then
    clear
  echo -e "\033[1;93m☉————————————————————————☉\033[0m"
  echo -e " CREATE VLESS ACCOUNT           "
  echo -e "\033[1;93m☉————————————————————————☉\033[0m"
    echo ""
    echo "A client with the specified name was already created, please choose another name."
    echo ""
    echo -e "\033[0;34m☉————————————————————————☉\033[0m"
    read -n 1 -s -r -p "Press any key to back on menu"
    menu
  fi
done
uuid=$(cat /proc/sys/kernel/random/uuid)
read -p "Expired (days): " masaaktif
#read -p "Limit User (GB): " Quota
read -p "Limit User (IP): " iplimit
tgl=$(date -d "$masaaktif days" +"%d")
bln=$(date -d "$masaaktif days" +"%b")
thn=$(date -d "$masaaktif days" +"%Y")
expe="$tgl $bln, $thn"
tgl2=$(date +"%d")
bln2=$(date +"%b")
thn2=$(date +"%Y")
tnggl="$tgl2 $bln2, $thn2"
exp=$(date -d "$masaaktif days" +"%Y-%m-%d")
sed -i '/#vless$/a\#& '"$user $exp"'\
},{"id": "'""$uuid""'","email": "'""$user""'"' /etc/xray/config.json
sed -i '/#vlessgrpc$/a\#& '"$user $exp"'\
},{"id": "'""$uuid""'","email": "'""$user""'"' /etc/xray/config.json

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


if [ ! -e /etc/vless ]; then
  mkdir -p /etc/vless
fi

if [[ $iplimit -gt 0 ]]; then
mkdir -p /etc/kyt/limit/vless/ip
echo -e "$iplimit" > /etc/kyt/limit/vless/ip/$user
else
echo > /dev/null
fi

if [ -z ${Quota} ]; then
  Quota="0"
fi

c=$(echo "${Quota}" | sed 's/[^0-9]*//g')
d=$((${c} * 1024 * 1024 * 1024))

if [[ ${c} != "0" ]]; then
  echo "${d}" >/etc/vless/${user}
fi
DATADB=$(cat /etc/vless/.vless.db | grep "^###" | grep -w "${user}" | awk '{print $2}')
if [[ "${DATADB}" != '' ]]; then
  sed -i "/\b${user}\b/d" /etc/vless/.vless.db
fi
echo "### ${user} ${exp} ${uuid} ${Quota} ${iplimit}" >>/etc/vless/.vless.db
clear
cat >/var/www/html/vless-$user.txt <<-END

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
echo -e "Remarks          : ${user}"
echo -e "Aktif Selama     : $masaaktif Hari"
echo -e "Dibuat Pada      : $tnggl"
echo -e "Berakhir Pada    : $expe"
echo -e "\033[1;93m☉———————————————————☉\033[0m"
echo ""
read -p "Enter Back To menu"
menu-vless
