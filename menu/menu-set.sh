#!/bin/bash
MYIP=$(wget -qO- ipinfo.io/ip);
clear 
        # background validation
        green_background="\033[42;37m"
        red_background="\033[41;37m"
        # color text 
        yelow="\e[1;33m"
        NC="\033[0m"
        cyan="\e[1;36m"
        white="\e[1;37m"
clear    
echo -e "        ═══════════════════════════════════════════"    
echo -e "                     ${red_background}SYSTEM MENU${NC}"
echo -e "        ═══════════════════════════════════════════"
echo -e "         ${white}[•1]${NC} ${cyan}ganti Domain vps\033[0m"
echo -e "         ${white}[•2]${NC} ${cyan}ganti Port\033[0m"
echo -e "         ${white}[•3]${NC} ${cyan}ganti banner\033[0m"
echo -e "         ${white}[•4]${NC} ${cyan}Restart service\033[0m"
echo -e "         ${white}[•5]${NC} ${cyan}Cek bandwith\033[0m"
echo -e "         ${white}[•6]${NC} ${cyan}Atur waktu riset\033[0m"
echo -e "         ${white}[•7]${NC} ${cyan}Speedtest vps\033[0m"
echo -e "         ${white}[•8]${NC} ${cyan}Backup-Bot-telegram\033[0m"
echo -e "         ${white}[•9]${NC} ${cyan}NS-Baru/SlowDns\033[0m"
echo -e "         ${white}[10]${NC} ${cyan}Helium\033[0m"
echo -e "         ${yelow}[•0]${NC} ${yelow}Back To Menu\033[0m"
echo -e "         ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo -e "${yellow}"
read -p " >>>   " opt
echo -e ""
case $opt in
1) clear ; menu-domain ; exit ;;
2) clear ; port-change ; exit ;;
3) clear ; nano /etc/issue.net ; exit ;;  #ssh-vpn banner.conf
4) clear ; restarts ; exit ;;
5) clear ; bw ; exit ;;
6) clear ; auto-reboot ; exit ;;
7) clear ; speedtest ; exit ;;
8) clear ; autobackup ;;
9) clear ; wget https://raw.githubusercontent.com/KhaiVpn767/SlowDnsV1/main/dns2.sh && chmod +x dns2.sh && ./dns2.sh ;;
10) clear ; m-helium;;
0) clear ; menu ; exit ;;
x) exit ;;
*) echo -e "" ; echo "salah tekan" ; sleep 1 ; menu-set ;;
esac
