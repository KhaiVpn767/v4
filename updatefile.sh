#!/bin/bash
dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
biji=`date +"%Y-%m-%d" -d "$dateFromServer"`
###########- COLOR CODE -##############
echo -e " [INFO] Downloading Update File"
sleep 2
# hapus menu
rm -rf menu
rm -rf menu-trial
rm -rf menu-vmess
rm -rf menu-vlesss
rm -rf renew-vless
rm -rf cek-vless
rm -rf addvless
rm -rf del-vless
rm -rf running
rm -rf clearcache
rm -rf menu-trgo
rm -rf menu-trojan
rm -rf menu-sshh
rm -rf menu-ssh
rm -rf menu-sshh
rm -rf usernew
rm -rf trial
rm -rf renew
rm -rf hapus
rm -rf cek
rm -rf member
rm -rf delete
rm -rf autokill
rm -rf ceklim
rm -rf autokilll
rm -rf tendang
rm -rf menu-set
rm -rf menu-domain
rm -rf add-host
rm -rf certv2ray
rm -rf menu-webmin
rm -rf speedtest
rm -rf about
rm -rf auto-reboot
rm -rf restart
rm -rf bw
rm -rf port-ssl
rm -rf port-ovpn
rm -rf xp
rm -rf sshws
rm -rf status
rm -rf menu-backup
rm -rf backup
rm -rf restore
rm -rf jam
rm -rf up
rm -rf trialvless
rm -rf addvless

# download script
cd /usr/bin
# menu
wget -O menu "https://raw.githubusercontent.com/KhaiVpn767/v4/main/menu/menu.sh"
wget -O menu-vmess "https://raw.githubusercontent.com/KhaiVpn767/v4/main/menu/menu-vmess.sh"
wget -O menu-vless "https://raw.githubusercontent.com/KhaiVpn767/v4/main/menu/menu-vless.sh"
wget -O running "https://raw.githubusercontent.com/KhaiVpn767/v4/main/menu/running.sh"
wget -O about "https://raw.githubusercontent.com/KhaiVpn767/v4/main/menu/about.sh"
wget -O clearcache "https://raw.githubusercontent.com/KhaiVpn767/v4/main/menu/clearcache.sh"
wget -O menu-trgo "https://raw.githubusercontent.com/KhaiVpn767/v4/main/menu/menu-trgo.sh"
wget -O menu-trojan "https://raw.githubusercontent.com/KhaiVpn767/v4/main/menu/menu-trojan.sh"
wget -O trialvless "https://raw.githubusercontent.com/KhaiVpn767/v4/main/xray/trialvless.sh"
wget -O renew-vless "https://raw.githubusercontent.com/KhaiVpn767/v4/main/xray/renew-vless.sh"
wget -O cek-vless "https://raw.githubusercontent.com/KhaiVpn767/v4/main/xray/cek-vless.sh"
wget -O del-vless "https://raw.githubusercontent.com/KhaiVpn767/v4/main/xray/del-vless.sh"
wget -O addvls "https://raw.githubusercontent.com/KhaiVpn767/v4/refs/heads/main/xray/addvls.sh"
wget -O addvless "https://raw.githubusercontent.com/KhaiVpn767/v4/main/xray/addvless.sh"

# menu ssh ovpn
wget -O menu-sshh "https://raw.githubusercontent.com/KhaiVpn767/v4/main/menu/menu-sshh.sh"
wget -O usernew "https://raw.githubusercontent.com/KhaiVpn767/v4/main/ssh/usernew.sh"
wget -O trial "https://raw.githubusercontent.com/KhaiVpn767/v4/main/ssh/trial.sh"
wget -O renew "https://raw.githubusercontent.com/KhaiVpn767/v4/main/ssh/renew.sh"
wget -O hapus "https://raw.githubusercontent.com/KhaiVpn767/v4/main/ssh/hapus.sh"
wget -O cek "https://raw.githubusercontent.com/KhaiVpn767/v4/main/ssh/cek.sh"
wget -O member "https://raw.githubusercontent.com/KhaiVpn767/v4/main/ssh/member.sh"
wget -O delete "https://raw.githubusercontent.com/KhaiVpn767/v4/main/ssh/delete.sh"
wget -O autokilll "https://raw.githubusercontent.com/KhaiVpn767/v4/main/ssh/autokilll.sh"
wget -O ceklim "https://raw.githubusercontent.com/KhaiVpn767/v4/main/ssh/ceklim.sh"
wget -O tendang "https://raw.githubusercontent.com/KhaiVpn767/v4/main/ssh/tendang.sh"

# menu system
wget -O menu-set "https://raw.githubusercontent.com/KhaiVpn767/v4/main/menu/menu-set.sh"
wget -O menu-domain "https://raw.githubusercontent.com/KhaiVpn767/v4/main/menu/menu-domain.sh"
wget -O add-host "https://raw.githubusercontent.com/KhaiVpn767/v4/main/ssh/add-host.sh"
wget -O certv2ray "https://raw.githubusercontent.com/KhaiVpn767/v4/main/xray/certv2ray.sh"
wget -O menu-webmin "https://raw.githubusercontent.com/KhaiVpn767/v4/main/menu/menu-webmin.sh"
wget -O speedtest "https://raw.githubusercontent.com/KhaiVpn767/v4/main/ssh/speedtest_cli.py"
wget -O about "https://raw.githubusercontent.com/KhaiVpn767/v4/main/menu/about.sh"
wget -O auto-reboot "https://raw.githubusercontent.com/KhaiVpn767/v4/main/menu/auto-reboot.sh"
wget -O restart "https://raw.githubusercontent.com/KhaiVpn767/v4/main/menu/restart.sh"
wget -O restarts "https://raw.githubusercontent.com/KhaiVpn767/v4/main/menu/restarts.sh"
wget -O bw "https://raw.githubusercontent.com/KhaiVpn767/v4/main/menu/bw.sh"
wget -O m-helium "https://raw.githubusercontent.com/KhaiVpn767/v4/main/menu/m-helium.sh"
wget -O autobackup "https://raw.githubusercontent.com/KhaiVpn767/v4/main/menu/autobackup"
wget -O updatefile "https://raw.githubusercontent.com/KhaiVpn767/v4/main/updatefile.sh"


# change port


# file tambahan

wget -O xp "https://raw.githubusercontent.com/KhaiVpn767/v4/main/ssh/xp.sh"
wget -O sshws "https://raw.githubusercontent.com/KhaiVpn767/v4/main/ssh/sshws.sh"
wget -O status "https://raw.githubusercontent.com/KhaiVpn767/v4/main/status.sh"
wget -O menu-backup "https://raw.githubusercontent.com/KhaiVpn767/v4/main/backup/menu-backup.sh"
wget -O backup "https://raw.githubusercontent.com/KhaiVpn767/v4/main/backup/backup.sh"
wget -O restore "https://raw.githubusercontent.com/KhaiVpn767/v4/main/backup/restore.sh"
wget -O bot "https://raw.githubusercontent.com/KhaiVpn767/v4/main/bot/bot.sh"
wget -O jam "https://raw.githubusercontent.com/KhaiVpn767/v4/main/jam.sh"
wget -O ram "https://raw.githubusercontent.com/KhaiVpn767/v4/main/menu/ram.sh"
wget -O dns "https://raw.githubusercontent.com/KhaiVpn767/v4/main/dns.sh"
wget -O fixcert "https://raw.githubusercontent.com/KhaiVpn767/v4/main/fixcert"

chmod +x menu
chmod +x menu-vmess
chmod +x menu-vless
chmod +x running
chmod +x clearcache
chmod +x menu-trgo
chmod +x menu-trojan
chmod +x trialvless
chmod +x addvless
chmod +x renew-vless
chmod +x cek-vless
chmod +x del-vless
chmod +x addvls

chmod +x menu-sshh
chmod +x usernew
chmod +x trial
chmod +x renew
chmod +x hapus
chmod +x cek
chmod +x member
chmod +x delete
chmod +x autokilll
chmod +x ceklim
chmod +x tendang

chmod +x menu-set
chmod +x menu-domain
chmod +x add-host
chmod +x certv2ray
chmod +x menu-webmin
chmod +x speedtest
chmod +x about
chmod +x auto-reboot
chmod +x restart
chmod +x restarts
chmod +x bw
chmod +x m-helium
chmod +x autobackup
chmod +x updatefile


chmod +x xp
chmod +x sshws
chmod +x status
chmod +x menu-backup
chmod +x backup
chmod +x restore
chmod +x bot
chmod +x jam
chmod +x ram
chmod +x dns
chmod +x fixcert
echo -e " [INFO] Update Successfully"
sleep 2
exit
