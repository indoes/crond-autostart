#!/system/bin/sh

until [ $(resetprop sys.boot_completed) -eq 1 ]; do
    sleep 90
done

if [[ ! -d "/data/crontab" ]]; then
   ui_print "/data/crontab dir missing, crond wasn't executed"
   exit 1
else
   /system/xbin/crond -b -c /data/crontab
   /system/xbin/busybox pgrep -x "crond"
      if [ $? -eq 1 ]; then
         #log -t Magisk "crond not running" 
		 ui_print "crond not running"
		 exit 1
      fi
   #log -t Magisk "crond is running"
   ui_print "crond is running"
   exit 0
fi