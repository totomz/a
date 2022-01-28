#!/bin/bash 

sed -ibk 's/^server/#&/' /etc/chrony.conf
echo "server ntp1.infocert.it iburst " >> /etc/chrony.conf
echo "server ntp2.infocert.it iburst " >> /etc/chrony.conf
echo "server ntp3.infocert.it iburst " >> /etc/chrony.conf
echo "server ntp4.infocert.it iburst " >> /etc/chrony.conf

systemctl stop ntpd
systemctl start chronyd

sleep 3
chronyc sources
