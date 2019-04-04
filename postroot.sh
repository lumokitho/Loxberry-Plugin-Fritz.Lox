#!/bin/sh

if [ -h "/etc/init.d/callmonitor" ]
then
	
	echo "<INFO> callmonitor stoppen."
	service callmonitor stop

	echo "<INFO> unlink /etc/init.d/callmonitor"
	rm -f "/etc/init.d/callmonitor"
fi

if [ -f "/etc/systemd/system/callmonitor.service" ]
then
	
	echo "<INFO> callmonitor stoppen."
	/bin/systemctl stop callmonitor.service
	rm -f "/etc/systemd/system/callmonitor.service"
	/bin/systemctl daemon-reload
fi

if [ -f "/etc/rsyslog.d/callmonitor.conf" ]
then
	
	echo "<INFO> rsyslog zur�cksetzen."
	rm -f "/etc/rsyslog.d/callmonitor.conf"
	/bin/systemctl restart rsyslog
fi 
