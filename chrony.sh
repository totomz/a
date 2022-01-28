#!/bin/bash 

if systemctl is-active --quiet chronyd ; then
	echo "##########################"
	echo "### chronyd is RUNNING ###"
	echo "##########################"
	exit 1
fi


sed -ibk 's/^server/#&/' /etc/chrony.conf
echo "server ntp1.infocert.it iburst " >> /etc/chrony.conf
echo "server ntp2.infocert.it iburst " >> /etc/chrony.conf
echo "server ntp3.infocert.it iburst " >> /etc/chrony.conf
echo "server ntp4.infocert.it iburst " >> /etc/chrony.conf
echo "/etc/chrony.conf updated" 

systemctl stop ntpd
systemctl start chronyd
echo "service sarted"

sleep 10
chronyc sources
