#!/sbin/sh

# Sleep before the script executed (in seconds)
sleep 90

if [ -d "/data/crontab" ]; then
   crond -b -c /data/crontab
   busybox pgrep -x "crond"
      if [ $? -eq 1 ]; then
         log -t Magisk "crond not running" 
      fi
   log -t Magisk "crond is running"
else
   log -t Magisk "/data/crontab dir missing, crond wasn't executed"
fi

exit 0
