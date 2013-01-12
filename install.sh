#!/bin/bash

echo "setting permissions for healthcheck.sh";
chmod 755 healthcheck.sh;

if [ ! -f /etc/crontab ];
then
  echo "/etc/crontab does not exist";
  exit 1;
fi

result=`grep -i '*/10 * * * *       root    /opt/cgminer-health-check/healthcheck.sh' /etc/crontab`

if [ -z "$result" ];
then
  echo "appending to /etc/crontab";
  echo "*/10 * * * *       root    /opt/cgminer-health-check/healthcheck.sh" >> /etc/crontab;
else
  echo "install already run on /etc/crontab";
fi