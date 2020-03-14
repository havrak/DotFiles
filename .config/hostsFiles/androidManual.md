# How to push /etc/hosts file to Android.

1. enable ADB and root over ADB
2. adb devices
3. adb shell
	1. su
	2. mount -o rw,remount /system
	3. exit
4. adb push .config/hostsFiles/hosts /system/etc/
5. adb shell
	1. mount -o ro,remount /system
	2. exit
