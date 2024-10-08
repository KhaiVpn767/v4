#!/bin/bash
# COLOR VALIDATION

clear
y='\033[1;33m' #yellow
BGX="\033[42m"
CYAN="\033[96m"
z="\033[96m"
RED='\033[0;31m'
NC='\033[0m'
gray="\e[1;30m"
Blue="\033[0;34m"
green='\033[0;32m'
grenbo="\e[92;1m"
purple="\033[1;95m"
YELL='\033[0;33m'
#INTALLER-UDP
UDPX="https://docs.google.com/uc?export=download&confirm=$(wget --quiet --save-cookies /tmp/cookies.txt --keep-session-cookies --no-check-certificate 'https://docs.google.com/uc?export=download&id=1S3IE25v_fyUfCLslnujFBSBMNunDHDk2' -O- | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1\n/p')&id=1S3IE25v_fyUfCLslnujFBSBMNunDHDk2"
ISP=$(cat /etc/xray/isp)
CITY=$(cat /etc/xray/city)
IPVPS=$(curl -s ipv4.icanhazip.com)
domain=$(cat /etc/xray/domain)
RAM=$(free -m | awk 'NR==2 {print $2}')
USAGERAM=$(free -m | awk 'NR==2 {print $3}')
MEMOFREE=$(printf '%-1s' "$(free -m | awk 'NR==2{printf "%.2f%%", $3*100/$2 }')")
LOADCPU=$(printf '%-0.00001s' "$(top -bn1 | awk '/Cpu/ { cpu = "" 100 - $8 "%" }; END { print cpu }')")
MODEL=$(cat /etc/os-release | grep -w PRETTY_NAME | head -n1 | sed 's/=//g' | sed 's/"//g' | sed 's/PRETTY_NAME//g')
CORE=$(printf '%-1s' "$(grep -c cpu[0-9] /proc/stat)")
DATEVPS=$(date +'%d/%m/%Y')
TIMEZONE=$(printf '%(%H:%M:%S)T')
SERONLINE=$(uptime -p | cut -d " " -f 2-10000)
clear
MYIP=$(curl -sS ipv4.icanhazip.com)
echo ""
#########################
# USERNAME
rm -f /usr/bin/user
username=$(curl https://raw.githubusercontent.com/KhaiVpn767/izinvps/ipuk/ip | grep $MYIP | awk '{print $2}')
#username=$(curl https://abc.xcodehoster.com/izin | grep $MYIP | awk '{print $2}')
echo "$username" >/usr/bin/user
# validity
rm -f /usr/bin/e
valid=$(curl https://raw.githubusercontent.com/KhaiVpn767/izinvps/ipuk/ip | grep $MYIP | awk '{print $3}')
#valid=$(curl https://abc.xcodehoster.com/izin | grep $MYIP | awk '{print $3}')
echo "$valid" >/usr/bin/e
# DETAIL ORDER
username=$(cat /usr/bin/user)
oid=$(cat /usr/bin/ver)
exp=$(cat /usr/bin/e)
clear
# CERTIFICATE STATUS
d1=$(date -d "$valid" +%s)
d2=$(date -d "$today" +%s)
certifacate=$(((d1 - d2) / 86400))
# VPS Information
DATE=$(date +'%Y-%m-%d')
datediff() {
    d1=$(date -d "$1" +%s)
    d2=$(date -d "$2" +%s)
    echo -e "$COLOR1 $NC Expiry In   : $(( (d1 - d2) / 86400 )) Days"
}
mai="datediff "$Exp" "$DATE""

# Status ExpiRED Active | Geo Project
Info="(${green}Active${NC})"
Error="(${RED}ExpiRED${NC})"
today=`date -d "0 days" +"%Y-%m-%d"`
Exp1=$(curl https://raw.githubusercontent.com/KhaiVpn767/izinvps/ipuk/ip | grep $MYIP | awk '{print $3}')
#Exp1=$(curl https://abc.xcodehoster.com/izin | grep $MYIP | awk '{print $3}')
if [[ $today < $Exp1 ]]; then
sts="${Info}"
else
sts="${Error}"
fi
echo -e "\e[32mloading...\e[0m"
clear

# OS Uptime
uptime="$(uptime -p | cut -d " " -f 2-10)"

# Getting CPU Information | Geo Project
cpu_usage1="$(ps aux | awk 'BEGIN {sum=0} {sum+=$3}; END {print sum}')"
cpu_usage="$((${cpu_usage1/\.*} / ${coREDiilik:-1}))"
cpu_usage+=" %"
ISP=$(curl -s ipinfo.io/org | cut -d " " -f 2-10 )
CITY=$(curl -s ipinfo.io/city )
WKT=$(curl -s ipinfo.io/timezone )
DAY=$(date +%A)
DATE=$(date +%m/%d/%Y)
DATE2=$(date -R | cut -d " " -f -5)
IPVPS=$(curl -s ipinfo.io/ip )
cname=$( awk -F: '/model name/ {name=$2} END {print name}' /proc/cpuinfo )
cores=$( awk -F: '/model name/ {core++} END {print core}' /proc/cpuinfo )
freq=$( awk -F: ' /cpu MHz/ {freq=$2} END {print freq}' /proc/cpuinfo )
tram=$( free -m | awk 'NR==2 {print $2}' )
uram=$( free -m | awk 'NR==2 {print $3}' )
fram=$( free -m | awk 'NR==2 {print $4}' )
clear
ssh_service=$(/etc/init.d/ssh status | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
dropbear_service=$(/etc/init.d/dropbear status | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
haproxy_service=$(systemctl status haproxy | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
xray_service=$(systemctl status xray | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
nginx_service=$(systemctl status nginx | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
#Status | Geo Project
clear
# STATUS SERVICE  SSH 
if [[ $ssh_service == "running" ]]; then 
   status_ssh="${green}ON✓${NC}"
else
   status_ssh="${RED}❌️${NC} "
fi

# // SSH Websocket Proxy
ssh_ws=$( systemctl status ws | grep Active | awk '{print $3}' | sed 's/(//g' | sed 's/)//g' )
if [[ $ssh_ws == "running" ]]; then
    status_ws_epro="${green}ON✓${NC}"
else
    status_ws_epro="${RED}❌️${NC} "
fi

# STATUS SERVICE HAPROXY
if [[ $haproxy_service == "running" ]]; then 
   status_haproxy="${green}ON✓${NC}"
else
   status_haproxy="${RED}❌️${NC} "
fi

# STATUS SERVICE XRAY
if [[ $xray_service == "running" ]]; then 
   status_xray="${green}ON✓${NC}"
else
   status_xray="${RED}❌️${NC} "
fi

# STATUS SERVICE NGINX
if [[ $nginx_service == "running" ]]; then 
   status_nginx="${green}ON✓${NC}"
else
   status_nginx="${RED}❌️${NC} "
fi

# STATUS SERVICE Dropbear
if [[ $dropbear_service == "running" ]]; then 
   status_dropbear="${green}ON✓${NC}"
else
   status_dropbear="${RED}❌️${NC} "
fi
#####INFOAKUN
vlx=$(grep -c -E "^#& " "/etc/xray/config.json")
let vla=$vlx/2
vmc=$(grep -c -E "^### " "/etc/xray/config.json")
let vma=$vmc/2
ssh1="$(awk -F: '$3 >= 1000 && $1 != "nobody" {print $1}' /etc/passwd | wc -l)"
trx=$(grep -c -E "^#! " "/etc/xray/config.json")
let trb=$trx/2
ssx=$(grep -c -E "^#ss# " "/etc/xray/config.json")
let ssa=$ssx/2
###########
KANAN="\033[1;32m<\033[1;33m<\033[1;31m<\033[1;31m$NC"
KIRI="\033[1;32m>\033[1;33m>\033[1;31m>\033[1;31m$NC"
########
r="\033[1;31m"  #REDTERANG
a=" ${CYAN} PREMIUM" 
echo -e " "
#figlet  MyRidwanVPN  | lolcat
#Warna Teks underline
ug="\033[4;32m" # HIJAU
ur="\033[4;31m" # MERAH
uy="\033[4;33m" # KUNING
uw="\033[4;37m" # PUTIH
uu="\033[4;35m" # UNGU
uc="\033[4;36m" # CYANN
ub="\033[4;30m" # BLACK
#Warna Text 
c="\e[1;36m" # CYANN
y="\e[1;33m" # KUNING
g="\e[1;32m" # HIJAU
w="\e[1;37m" # PUTIH
u="\e[1;35m" # UNGU
r="\e[1;31m" # MERAH
NC="\e[0m"
# background
GB="\033[42;37m" # HIJAU BACKGROUND
RB="\033[41;37m" # MERAH BACKGROUND
MYIP=$(curl -sS ipv4.icanhazip.com)
clear   
echo -e " ${w}${NC}"
echo -e "       ───────────────────────────────────────────"
echo -e "        ${GB}              RIZYUL TUNNEL              ${NC}" 
echo -e "       ───────────────────────────────────────────"
 echo -e "          ┌──────────────────────────────────┐"                   
 echo -e "          │ ${c} SYSTEM OS : $MODEL ${NC}"
 echo -e "          │ ${c} ISP VPS   : $ISP ${NC}"
 echo -e "          │ ${c} CPU       : $CORE CORE${NC}" 
 echo -e "          │ ${c} RAM       : $RAM Mb ${NC}"
 echo -e "          │ ${c} UPTIME    : $uptime ${NC}"
 echo -e "          │ ${c} IP VPS    : $IPVPS ${NC}"
 echo -e "          │ ${c} DOMAIN    : $domain ${NC}"
 echo -e "          │ ${c} DATE      : $DATE${NC}"
 echo -e "          │ ${c} User SC   : $username${NC} $sts"
 echo -e "          │ ${c} Xpired    : $exp$NC ($r$certifacate${NC} Days)"
 echo -e "          └──────────────────────────────────┘"  
echo -e "                    ssh : $ssh1  vmess : $vma"
echo -e "             shadow : $ssa  vless : $vla  trojan : $trb"
echo -e "       ${r}┌─────────────────────────────────────────┐${NC}" 
echo -e "       ${r}│ [${u}•1${y}]${NC} SSH & UDP  "   "   ${y}[${u}•6${y}]${NC} CHECK RUNNING"
echo -e "       ${r}│ [${u}•2${y}]${NC} VMESS Xray "   "   ${y}[${u}•7${y}]${NC} RESTR SERVICE"  
echo -e "       ${r}│ [${u}•3${y}]${NC} VLESS Xray "   "   ${y}[${u}•8${y}]${NC} BACKUP MENU  " 
echo -e "       ${r}│ [${u}•4${y}]${NC} TROJAN-WS  "   "   ${y}[${u}•9${y}]${NC} CHANGE BANNER"
echo -e "       ${r}│ [${u}•5${y}]${NC} SHADOWSOCK "   "   ${y}[${u}10${y}]${NC} MENU SETTINGS"
echo -e "       ${r}└─────────────────────────────────────────┘${NC}"
echo -e "                          "
echo -e "      ${w}               Version : 2.0.9 ${NC}"
echo -e "                     ${y}___${r}___${u}___${w}___${c}___${g}${NC}"
echo -e   "${g}"
read -p " select menu >>   "  opt
echo -e   ""
case $opt in
1 | 01)✿
clear
m-sshws
;;
2 | 02)
clear
m-vmess
;;
3 | 03)
clear
m-vless
;;
4 | 04)
clear
m-trojan
;;
5 | 05)
clear
m-ssws
;;
6 | 06)
clear
run
;;
7 | 07)
clear
restart
echo ""
echo -e " ${GREEN} Back to menu in 1 sec ${NC}"
sleep 1
menu
;;
8 | 08)
clear
menu-backup
echo ""
echo -e " ${GREEN} Back to menu in 1 sec ${NC}"
sleep 1
menu
;;
9 | 09)
clear
bot
;;
10)
clear
setting
echo ""
read -n 1 -s -r -p "Press any key to back on menu"
menu
;;
x)
menu
;;
*)
echo -e ""
menu
;;
esac
