#!/sbin/sh

#
# Crond Autostart
#

# Checking for installation environment
if [ $BOOTMODE = true ]; then
ROOT=$(find `magisk --path` -type d -name "mirror" | head -n 1)
ui_print "- Root path: $ROOT"
else
ROOT=""
fi

# Check device SDK
sdk="$(getprop ro.build.version.sdk)"
if [[ !"$sdk" -ge "23" ]]; then
ui_print "- Unsupported SDK version: $sdk"
exit 1
fi

# Check for busybox-ndk crond
if [ command -v /system/xbin/crond &> /dev/null ]; then
   ui_print "Crond does not exist. Please install Busybox first"
   exit 1
fi

# Check for folder /data/crontab
if [[ ! -d "/data/crontab" ]]; then
   ui_print "/data/crontab dir not found"
   exit 1
fi

# Clean up
rm -rf $MODPATH/LICENSE