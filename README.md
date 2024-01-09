# Crond Autostarter

---
## Overview
- Starts busybox-ndk crond as late_start 80 seconds after boot
- Support API 23 or later
- Support Magisk Live or Custom Recovery installations

---
## Instructions
- Install Crond Autostarter
- Create a directory `/data/crontab`.
- Create the cronjob file in directory `/data/crontab/` with name root
- Write your cronjob inside file root

---
## Note
- **Busybox is needed** to run crond service. It is recommended to install "Busybox for Android NDK" module from Magisk Manager.
