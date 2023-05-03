!#bash.sh
echo *****system info*****
echo
date
echo
uptime
echo @@@@@kernel version@@@@@
uname -a
echo
uname -r
echo
ifconfig -a
echo
df -h
echo
free -h;free -m;free -g
echo
echo
swapon -s
echo
showmount -e
netstat -rn
echo
chkconfig --list egrep -i "iptables|NetworkManager|sshd|httpd|nfs"
echo 
hostname
echo 
getenforce
echo
cat /proc/net/bonding/bond*
echo
###################system info############################
