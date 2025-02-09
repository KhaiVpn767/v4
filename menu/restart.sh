#!/bin/bash
NC='\033[0m'
yell='\e[33m'
clear
fun_bar() {
    CMD[0]="$1"
    CMD[1]="$2"
    (
        [[ -e $HOME/fim ]] && rm $HOME/fim
        ${CMD[0]} -y >/dev/null 2>&1
        ${CMD[1]} -y >/dev/null 2>&1
        touch $HOME/fim
    ) >/dev/null 2>&1 &
    tput civis
    echo -ne "  \033[0;33mPlease Wait Loading \033[1;37m- \033[0;33m["
    while true; do
        for ((i = 0; i < 18; i++)); do
            echo -ne "\033[0;32m="
            sleep 0.1s
        done
        [[ -e $HOME/fim ]] && rm $HOME/fim && break
        echo -e "\033[0;33m]"
        sleep 1s
        tput cuu1
        tput dl1
        echo -ne "  \033[0;33mPlease Wait Loading \033[1;37m- \033[0;33m["
    done
    echo -e "\033[0;33m]\033[1;37m -\033[1;32m OK !\033[1;37m"
    tput cnorm
}
res1() {
    systemctl daemon-reload
}
res2() {
    systemctl restart nginx
}
res3() {
    systemctl restart xray
}
res4() {
    systemctl restart fail2ban
}
res5() {
    systemctl restart ssh
}
res6() {
    systemctl restart rc-local
}
res7() {
    systemctl restart dropbear
}
res8() {
    systemctl restart ws
}
res9() {
    systemctl restart openvpn
}
res10() {
    systemctl restart cron
}
res11() {
    systemctl restart haproxy
}
res12() {
    systemctl restart netfilter-persistent
}
res13() {
    systemctl restart squid
}
res14() {
    systemctl disable udp-mini-1
    systemctl stop udp-mini-1
    systemctl enable udp-mini-1
    systemctl start udp-mini-1
    systemctl disable udp-mini-2
    systemctl stop udp-mini-2
    systemctl enable udp-mini-2
    systemctl start udp-mini-2
    systemctl disable udp-mini-3
    systemctl stop udp-mini-3
    systemctl enable udp-mini-3
    systemctl start udp-mini-3
}
netfilter-persistent
clear
echo -e "${yell}┌──────────────────────────────────────────┐${NC}"
echo -e "${yell}│$NC           RESTART ALL SERVICE           $NC"
echo -e "${yell}└──────────────────────────────────────────┘${NC}"
echo -e ""
echo -e "  \033[1;91m service daemon-reload\033[1;37m"
fun_bar 'res1'
echo -e "  \033[1;91m service restart nginx\033[1;37m"
fun_bar 'res2'
echo -e "  \033[1;91m service restart xray\033[1;37m"
fun_bar 'res3'
echo -e "  \033[1;91m service restart fail2ban\033[1;37m"
fun_bar 'res4'
echo -e "  \033[1;91m service restart rc-local\033[1;37m"
fun_bar 'res5'
echo -e "  \033[1;91m service restart ssh\033[1;37m"
fun_bar 'res6'
echo -e "  \033[1;91m service restart dropbear\033[1;37m"
fun_bar 'res7'
echo -e "  \033[1;91m service restart websocket\033[1;37m"
fun_bar 'res8'
echo -e "  \033[1;91m service restart openvpn\033[1;37m"
fun_bar 'res9'
echo -e "  \033[1;91m service restart cron\033[1;37m"
fun_bar 'res10'
echo -e "  \033[1;91m service restart haproxy\033[1;37m"
fun_bar 'res11'
echo -e "  \033[1;91m service restart netfilter-persistent\033[1;37m"
fun_bar 'res12'
echo -e "  \033[1;91m service restart squid\033[1;37m"
fun_bar 'res13'
echo -e "  \033[1;91m service restart badvpn\033[1;37m"
fun_bar 'res14'
echo -e ""
sleep 2
menu
