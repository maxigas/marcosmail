#!/bin/bash

# Requirements:
# apt-get install mailutils

HOSTNAME=`hostname`
IP=`ifconfig eth0|grep inet|awk '{print $2}'|sed s/addr://`
if [ -f /tmp/ip ]
then OLDIP=`cat /tmp/ip`
else OLDIP=0.0.0.0
fi

if ! [ "$OLDIP" = "$IP" ]
then mail -s "$HOSTNAME changed IP from $OLDIP to $IP." maxigas@anargeek.net
fi

echo $IP > /tmp/ip


