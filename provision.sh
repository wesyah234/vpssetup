#!/bin/bash

set -e # Exit script immediately on first error.

#first test to be sure there is a  file present:
if [ ! -f /etc/hosts ]; then
  echo " "
  echo "etc hosts not there"
  echo " "
  echo "---------------------------------------------------------------------------------------"
  exit
fi

echo "changing sshd port"
sed -e "s/Port 22/Port 22000/g" /etc/ssh/sshd_config > /tmp/1.txt
cp /tmp/1.txt /etc/ssh/sshd_config
echo "changing permit root login"
sed -e "s/PermitRootLogin yes/PermitRootLogin no/g" /etc/ssh/sshd_config > /tmp/1.txt
cp /tmp/1.txt /etc/ssh/sshd_config
echo "setting keepalive stuff"
echo "ClientAliveInterval 30" >> /etc/ssh/sshd_config
echo "ClientAliveCountMax 5" >> /etc/ssh/sshd_config
echo "ServerAliveInterval 60" >> /etc/ssh/sshd_config
echo "restarting sshd"
#service sshd restart
