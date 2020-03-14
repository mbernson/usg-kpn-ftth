#!/bin/vbash
readonly logFile="/var/log/postprovisionvpn.log"

source /opt/vyatta/etc/functions/script-template

configure > ${logFile}

delete system task-scheduler task postprovisionvpn >> ${logFile}
set vpn ipsec ipsec-interfaces interface pppoe2 >> ${logFile}
delete vpn l2tp remote-access dhcp-interface eth0 >> ${logFile}
set vpn l2tp remote-access outside-address 0.0.0.0 >> ${logFile}
commit
exit
